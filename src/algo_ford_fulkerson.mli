open Graph 
open Tools
open Gfile

val f_path: int graph -> path -> id -> id -> path
(*si pas de path trouvé -> renvoie "", sinon renvoyer "le_path" du grave*)

val algomain: int graph -> int -> int -> id -> id -> int * int graph

val flow: int * int graph -> int

val end_graph: int * int graph -> int graph