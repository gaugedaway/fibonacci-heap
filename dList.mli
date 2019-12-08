type 'a dlist
exception DListException
val make : unit -> 'a dlist
val empty : 'a dlist -> bool
val insert : 'a dlist -> 'a -> unit
val remove : 'a dlist -> unit
val foreach : 'a dlist -> ('a dlist -> unit) -> unit
val get_val : 'a dlist -> 'a
