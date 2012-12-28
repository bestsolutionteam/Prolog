flatten(List, Flattened):-
  flatten(List, [], Flattened).

flatten([], Flattened, Flattened).

flatten([Item|Tail], L, Flattened):-
  flatten(Item, L1, Flattened),
  flatten(Tail, L, L1).
flatten(Item, Flattened, [Item|Flattened]):-
  \+ is_list(Item).
