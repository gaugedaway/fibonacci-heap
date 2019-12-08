type 'a dlist =
  {v: 'a option; mutable next: 'a dlist; mutable prev: 'a dlist}

exception DListException

let make () =
  let rec e = {v = None; next = e; prev = e} in
  e

let empty l = l.next = l

let insert l x =
  let e = {v = Some x; next = l.next; prev = l} in
  l.next.prev <- e;
  l.next <- e

let remove e =
  match e.v with
  | None -> raise DListException
  | _ -> e.prev.next <- e.next;
         e.next.prev <- e.prev

let foreach l f =
  let e = ref l.next in
  while !e.v <> None do
    f !e;
    e := !e.next
  done

let get_val e =
  match e.v with
  | None -> raise DListException
  | Some x -> x

let append a b =
  a.prev.next <- b.next;
  b.next.prev <- a.prev;
  a.prev <- b.prev;
  b.prev.next <- a
