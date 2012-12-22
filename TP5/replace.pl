split(L,0,[],L).
split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).

index_of(_,K,KT,[],_) :- K=KT.
index_of(V,K,KT,[H|T],Len) :-
	(
	V = H,append(KT,[Len],KT1);
	KT1 =KT
	),
	Len1 is Len + 1,
	index_of(V,K,KT1,T,Len1).
index_of(V,K,L) :-
	var(K),index_of(V,K,[],L,0);
	write('Wrong Input').

replace_one(V,I,L,NL) :-
	split(L,I,L1,L2),
	append(L1,[V],L11),
	(
	length(L,Len),Len =:= I+1,NL=L11;
	split(L2,1,_,L22),append(L11,L22,L3),NL=L3
	).

loop_key([],_,NL,NL).
loop_key(NV,[H|T],OL,NL) :- replace_one(NV,H,OL,NL),loop_key(NV,T,NL,NL).

replace_elements(OV,NV,OL,NL) :-
	index_of(OV,K,OL),
	loop_key(NV,K,OL,NL).





