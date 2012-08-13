open Common
open Lwt
open Mrt
open ParsingEngine
open LwtParsingEngine

open Getopt

let set_raw () =
  enrich_mrt_message_content := false;
  enrich_mrt_subtype := false

let options = [
  mkopt (Some 'h') "help" Usage "show this help";
  mkopt (Some 'r') "raw" (TrivialFun set_raw) "do not parse in depth the MRT messages";
]

let getopt_params = {
  default_progname = "test_mrt";
  options = options;
  postprocess_funs = [];
}


let input_of_filename filename =
  Lwt_unix.openfile filename [Unix.O_RDONLY] 0 >>= fun fd ->
  return (input_of_fd filename fd)

let rec handle_input input =
  lwt_parse_mrt_message input >>= fun mrt_msg ->
  print_endline (print_mrt_message "" "Message" mrt_msg);
  handle_input input


let _ =
  let args = parse_args getopt_params Sys.argv in
  let t = match args with
    | [] -> handle_input (input_of_channel "(stdin)" Lwt_io.stdin)
    | [filename] -> input_of_filename filename >>= handle_input
    | _ -> failwith "Too many files given"
  in
  try
    Lwt_unix.run t;
  with
    | End_of_file -> ()
    | ParsingException (e, i) -> emit_parsing_exception false e i
    | LwtParsingException (e, i) -> emit_lwt_parsing_exception false e i
    | e -> print_endline (Printexc.to_string e)
