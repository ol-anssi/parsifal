open Language
open Types
open Modules


exception ReturnValue of value
exception Continue
exception Break


(* Interpretation *)

let rec  eval_string_token env = function
  | ST_String s -> s
  | ST_Var s -> eval_as_string (getv env s)
  | ST_Expr s -> eval_as_string (interpret_string env s)

and eval_exp env exp =
  let eval = eval_exp env in
  match exp with
    | E_Bool b -> V_Bool b
    | E_Int i -> V_Int i
    | E_String l -> V_String (String.concat "" (List.map (eval_string_token env) l))
    | E_Var s -> getv env s

    | E_Concat (a, b) -> begin
      match eval a, eval b with
	| V_BinaryString s1, v2 -> V_BinaryString (s1 ^ (eval_as_string v2))
	| v1, V_BinaryString s2 -> V_BinaryString ((eval_as_string v1) ^ s2)
	| v1, v2 -> V_String ((eval_as_string v1) ^ (eval_as_string v2))
    end
    | E_Plus (a, b) -> V_Int ((eval_as_int (eval a)) + (eval_as_int (eval b)))
    | E_Minus (a, b) -> V_Int (eval_as_int (eval a) - eval_as_int (eval b))
    | E_Mult (a, b) -> V_Int (eval_as_int (eval a) * eval_as_int (eval b))
    | E_Div (a, b) -> V_Int (eval_as_int (eval a) / eval_as_int (eval b))
    | E_Mod (a, b) -> V_Int (eval_as_int (eval a) mod eval_as_int (eval b))

    | E_Equal (a, b) -> V_Bool (eval_equality env (eval a) (eval b))
    | E_Lt (a, b) -> V_Bool (match eval a, eval b with
	| V_Int i1, V_Int i2 -> i1 < i2
	| V_Bigint _, V_Bigint _ -> raise NotImplemented
	| v1, v2 -> eval_as_string v1 < eval_as_string v2
    )
    | E_In (a, b) -> V_Bool (eval_in env (eval a) (eval b))

    | E_Like (a, b) ->
      V_Bool (Str.string_match (Str.regexp (eval_as_string (eval b)))
		(eval_as_string (eval a)) 0)

    | E_LAnd (a, b) -> V_Bool (eval_as_bool (eval a) && eval_as_bool (eval b))
    | E_LOr (a, b) -> V_Bool (eval_as_bool (eval a) || eval_as_bool (eval b))
    | E_LNot e -> V_Bool (not (eval_as_bool (eval e)))

    | E_BAnd (a, b) -> V_Int (eval_as_int (eval a) land eval_as_int (eval b))
    | E_BOr (a, b) -> V_Int (eval_as_int (eval a) lor eval_as_int (eval b))
    | E_BXor (a, b) -> V_Int (eval_as_int (eval a) lxor eval_as_int (eval b))
    | E_BNot e -> V_Int (lnot (eval_as_int (eval e)))

    | E_Exists e -> begin
      try
	ignore (eval e);
	V_Bool true
      with Not_found -> V_Bool false
    end

    | E_Function (arg_names, e) ->
      let na = List.length arg_names in
      let new_env = Hashtbl.create (2 * na) in
      V_Function (InterpretedFun (new_env::env, arg_names, e))
    | E_Local ids ->
      let rec add_locals ids =
	match env, ids with
	  | _, [] -> V_Unit
	  | [], _ -> raise Not_found
	  | e::_, id::r ->
	    Hashtbl.replace e id V_Unit;
	    add_locals r
      in
      add_locals ids
    | E_Apply (e, args) -> begin
      let f_value = eval_as_function (eval e) in
      let arg_values = List.map eval args in
      eval_function env f_value arg_values
    end
    | E_Return (Some e) -> raise (ReturnValue (eval e))
    | E_Return None -> raise (ReturnValue V_Unit)

    | E_List e -> V_List (List.map eval e)
    | E_Cons (e1, e2) -> V_List ((eval e1)::(eval_as_list (eval e2)))

    | E_GetField (e, f) -> get_field (eval e) f
    | E_SetField (e, f, v) -> set_field false (eval e) f (eval v)

    | E_Assign (var, e) ->
      setv env var (eval e);
      V_Unit
    | E_Unset (var) ->
      unsetv env var;
      V_Unit
    | E_IfThenElse (i, t, e) ->
      eval_exps env (if (eval_as_bool (eval i)) then t else e)
    | E_While (cond, body) -> begin
      try
	while (eval_as_bool (eval cond)) do
	  try
	    ignore (eval_exps env body)
	  with Continue -> ()
	done;
	V_Unit;
      with Break -> V_Unit
    end
    | E_Continue -> raise Continue
    | E_Break -> raise Break

and eval_function env f args = match f with
  | NativeFun f -> f args
  | NativeFunWithEnv f -> f env args
  | InterpretedFun (saved_env::r, arg_names, body) ->
    let local_env = Hashtbl.copy saved_env in
    let rec instanciate_and_eval = function
      | [], [] -> begin
	try
	  eval_exps (local_env::r) body
	with
	  | ReturnValue v -> v
      end
      | remaining_names, [] ->
	V_Function (InterpretedFun (local_env::r, remaining_names, body))
      | name::names, value::values ->
	Hashtbl.replace local_env name value;
	instanciate_and_eval (names, values)
      | _ -> raise WrongNumberOfArguments
    in instanciate_and_eval (arg_names, args)
  | InterpretedFun _ -> failwith "eval_function called on an InterpretedFun with an empty saved_environment"

and eval_equality env a b =
  let rec equal_list = function
    | [], [] -> true
    | va::ra, vb::rb ->
      (eval_equality env va vb) && (equal_list (ra, rb))
    | _ -> false
  in
  match a, b with
    | V_Unit, V_Unit -> true
    | V_Bool b1, V_Bool b2 -> b1 = b2
    | V_Int i1, V_Int i2 -> i1 = i2
    | V_BitString (n1, s1), V_BitString (n2, s2) -> n1 = n2 && s1 = s2

    | V_List l1, V_List l2 -> equal_list (l1, l2)
    | V_Dict d1, V_Dict d2 -> raise NotImplemented

    | V_Module (n1), V_Module (n2) -> n1 = n2
    | V_Object (n1, r1, d1), V_Object (n2, r2, d2) ->
      if n1 <> n2 then false else begin
	if r1 = r2 then true
	else begin
	  let m = Hashtbl.find modules n1 in
	  let module M = (val m : Module) in
	  M.equals (r1, d1) (r2, d2);
	end
      end

    | v1, v2 ->
      eval_as_string v1 = eval_as_string v2

and eval_in env a b =
  let rec eval_in_list = function
    | [] -> false
    | v::r -> (eval_equality env a v) || (eval_in_list r)
  in
  match b with
    | V_List l -> eval_in_list l
    | V_Dict d -> Hashtbl.mem d (eval_as_string a)
    | _ -> raise (ContentError "List or dict expected")


and eval_exps env = function
  | [] -> V_Unit
  | [e] -> eval_exp env e
  | e::r ->
    ignore (eval_exp env e);
    eval_exps env r

and interpret_string env s =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.exprs Lexer.main_token lexbuf in
  eval_exps env ast

and get_field e f =
  match e with
    | V_Dict d -> (Hashtbl.find d f)

    | V_Module n -> begin
      let module M = (val (Hashtbl.find modules n) : Module) in
      try
	Hashtbl.find M.static_params f
      with Not_found -> (Hashtbl.find M.param_getters f) ()
    end

    | V_Object (n, obj_ref, d) ->
      let module M = (val (Hashtbl.find modules n) : Module) in
      M.enrich obj_ref d;
      if f = "_dict" then V_Dict d else (Hashtbl.find d f)

    | _ -> raise (ContentError ("Object with fields expected"))

and get_field_all e f =
  match e with
    | V_Dict d -> V_List (Hashtbl.find_all d f)

    | V_Module n -> begin
      let module M = (val (Hashtbl.find modules n) : Module) in
      try
	V_List [Hashtbl.find M.static_params f]
      with Not_found -> V_List [(Hashtbl.find M.param_getters f) ()]
    end

    | V_Object (n, obj_ref, d) ->
      let module M = (val (Hashtbl.find modules n) : Module) in
      M.enrich obj_ref d;
      if f = "_dict" then V_List ([V_Dict d]) else V_List (Hashtbl.find_all d f)

    | _ -> raise (ContentError ("Object with fields expected"))

and set_field append e f v =
  let add_function = if append then Hashtbl.add else Hashtbl.replace in
  begin
    match e with
      | V_Dict d -> (add_function d f v)

      | V_Module n ->
	if append then raise (ContentError ("Module params can not have multiple values"));
	let module M = (val (Hashtbl.find modules n) : Module) in
	(Hashtbl.find M.param_setters f) v

      | V_Object (n, obj_ref, d) ->
	if f = "_dict" then raise (ContentError ("Read-only field"));
	let module M = (val (Hashtbl.find modules n) : Module) in
	M.enrich obj_ref d;
	add_function d f v;
	Hashtbl.replace d "@modified" V_Unit

      | _ -> raise (ContentError ("Object with mutable fields expected"))
  end;
  V_Unit

and unset_field e f =
  begin
    match e with
      | V_Dict d -> (Hashtbl.remove d f)

      | V_Module n ->
	raise (ContentError ("Module params can not be removed"));

      | V_Object (n, obj_ref, d) ->
	if f = "_dict" then raise (ContentError ("Read-only field"));
	let module M = (val (Hashtbl.find modules n) : Module) in
	M.enrich obj_ref d;
	Hashtbl.remove d f;
	Hashtbl.replace d "@modified" V_Unit

      | _ -> raise (ContentError ("Object with mutable fields expected"))
  end;
  V_Unit