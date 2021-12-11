open Core
open Helpers

let euler1 (x: int) : int =
    let cond : int -> bool = fun n -> n mod 3 = 0 || n mod 5 = 0 in
    let open Sequence in
    let validnums: int sequence = range 0 x |> filter ~f:cond
    in fold validnums ~init:0 ~f:(+)

let euler1alt (x: int) : int =
    let cond : int -> bool = fun n -> n mod 3 = 0 || n mod 5 = 0 in
    let open Sequence in
    let (>>) a b = a >>= fun _ -> Lazy.force b in
    let guard (c: bool) : unit sequence = if c then return () else empty in
    let validnums: int sequence = let open Let_syntax in
        let%bind num = range 0 x in
        guard (cond num) >>
        lazy (return num)
    in fold validnums ~init:0 ~f:(+)

let euler2 (cap: int): int = 
    let open Continue_or_stop in
    let f acc x = match x with
                    | y when y > cap -> Stop acc
                    | y when (y mod 2 = 0) -> Continue (acc + y)
                    | _ -> Continue acc
    in Sequence.fold_until fibs ~init:0 ~f:f ~finish:Fn.id
