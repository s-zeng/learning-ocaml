open Core

let (@$) f x = f x
let fibs: int Sequence.sequence = Sequence.unfold ~init:(0, 1) ~f:(fun (a, b) -> Option.some (a, (b, a+b)))

