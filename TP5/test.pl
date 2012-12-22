split(L,0,[],L).
split([X|Xs],N,[X|Ys],Zs) :-
	N > 0, N1 is N - 1,
	split(Xs,N1,Ys,Zs).

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


is_have(C,L) :- \+  nth0(_,L,C).

write_one([],L,TN,L1,T1) :- L=L1,TN=T1.
write_one([H|T],L,TN,L1,T1) :-
	\+ nth0(_,L1,H),
	append(L1,[H],L2),
	append(T1,[1],T2),
	write_one(T,L,TN,L2,T2);
	nth0(P,L1,H),PN is P+1,plus_at(1,PN,T1,T2),
	write_one(T,L,TN,L1,T2).
