flatten(List, Flattened):-
  flatten(List, [], Flattened).

flatten([], Flattened, Flattened).

flatten([Item|Tail], L, Flattened):-
  flatten(Item, L1, Flattened),
  flatten(Tail, L, L1).
flatten(Item, Flattened, [Item|Flattened]):-
  \+ is_list(Item).

remove_at(X,[X|Xs],1,Xs).
remove_at(X,[Y|Xs],K,[Y|Ys]) :- K > 1,
   K1 is K - 1, remove_at(X,Xs,K1,Ys).

insert_at(X,L,K,R) :-
	remove_at(X,R,K,L).


plus_at(N,P,L,L1) :-
	PN is P-1,
	nth0(PN,L,NP),
	NN is NP + N,
	remove_at(_,L,P,LN),
	insert_at(NN,LN,P,L1).

write_one([],L,TN,L1,T1) :- L=L1,TN=T1.
write_one([H|T],L,TN,L1,T1) :-
	\+ nth0(_,L1,H),
	append(L1,[H],L2),
	append(T1,[1],T2),
	write_one(T,L,TN,L2,T2);
	nth0(P,L1,H),PN is P+1,plus_at(1,PN,T1,T2),
	write_one(T,L,TN,L1,T2).


count_atom(L,LC,LN) :-
	flatten(L,FL),
	write_one(FL,LC,LN,[],[]).
