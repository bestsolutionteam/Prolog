mirror([],L1,L2) :- L2=L1.

mirror([H|T],L1,L2) :- mirror(T,[H|L1],L2).

mirror(L1,L2) :- mirror(L1,[],L2).