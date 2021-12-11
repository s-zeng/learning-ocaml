open Core
open Puzzles.Implementations

let main : unit = 
    print_endline "Hello, World!";
    Sexp.to_string_hum [%sexp ([3;4;5] : int list)]
      |> print_endline;
    Printf.printf "Euler1: %d\n" (euler1 1000);
    Printf.printf "Euler1 (alt): %d\n" (euler1alt 1000);
    Printf.printf "Euler2: %d\n" (euler2 4000000);
    print_endline "Bye, world!";
