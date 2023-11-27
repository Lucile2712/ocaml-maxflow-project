open Gfile
open Tools
    
let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)
  
  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  (*let result = clone_nodes graph in*)

  let f lbl = int_of_string lbl in
  let f1 lbl = string_of_int lbl in
  let result2 = gmap graph f in
  (*let result3 = gmap result2 f1 in*)

  let result4 = add_arc result2 3 1 100 in
  let result5 = gmap result4 f1 in

  let () = export "dot_format_graphs/graph1" graph in


  (* Rewrite the graph that has been read. *)
  let () = write_file outfile result5 in

  ()

