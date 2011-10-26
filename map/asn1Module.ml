open MapEval
open MapModule


let value_of_asn1_content o = match o.Asn1.a_content with
  | Asn1.Null -> V_Unit
  | Asn1.Boolean b -> V_Bool b
  | Asn1.Integer i -> V_Bigint i
  | Asn1.BitString (n, s) -> V_BitString (n, s)
  | Asn1.OId oid ->  (* TODO *) raise NotImplemented (* V_List (List.map (fun x -> V_Int x) (Asn1.oid_expand oid)) *)
  | Asn1.String (s, true) -> V_BinaryString s
  | Asn1.String (s, false) -> V_String s
  | Asn1.Constructed objs -> (* TODO *) raise NotImplemented (*V_List (List.map (fun x -> V_Asn1 x) objs)*)



module Asn1Parser = struct
  type t = Asn1.asn1_object
  let name = "asn1"
  let params : (string, value) Hashtbl.t = Hashtbl.create 10

  (* TODO: Make these options mutable from the language ? *)
  let opts = { Asn1.type_repr = Asn1.PrettyType; Asn1.data_repr = Asn1.PrettyData;
	       Asn1.resolver = Some X509.name_directory; Asn1.indent_output = true };;

  let init () =
    Hashtbl.replace params "_tolerance" (V_Int Asn1.Asn1EngineParams.s_specfatallyviolated);
    Hashtbl.replace params "_minDisplay" (V_Int 0)

  let parse name stream =
    let tolerance = eval_as_int (Hashtbl.find params "_tolerance")
    and minDisplay = eval_as_int (Hashtbl.find params "_minDisplay") in
    let ehf = Asn1.Engine.default_error_handling_function tolerance minDisplay in
    let pstate = Asn1.Engine.pstate_of_stream ehf name stream in
    try
      Asn1.parse pstate
    with 
      | Asn1.Engine.ParsingError (err, sev, pstate) ->
	raise (ContentError ("Parsing error: " ^ (Asn1.Engine.string_of_exception err sev pstate)))

  let dump = Asn1.dump

  let enrich o dict =
    Hashtbl.replace dict "class" (V_String (Asn1.string_of_class o.Asn1.a_class));
    Hashtbl.replace dict "tag" (V_Int (o.Asn1.a_tag));
    Hashtbl.replace dict "tag_str" (V_String (Asn1.string_of_tag o.Asn1.a_class o.Asn1.a_tag));
    Hashtbl.replace dict "is_constructed" (V_Bool (Asn1.isConstructed o));
    Hashtbl.replace dict "content" (value_of_asn1_content o)

  let update dict = (* TODO *) raise NotImplemented

  let to_string o = Asn1.string_of_object "" opts o
end

module Asn1Module = Make (Asn1Parser)
let _ = add_module ((module Asn1Module : MapModule))