swapfl([H1|T1],[H2|T2]) :-
	L1=[H2|T1], reverse(L1,L11),
	L2=[H1|T2], reverse(L2,L22),
	L11 = [H11|T11], L22 = [H22|T22],
	L111 = [H22|T11], reverse(L111,R1),
	L222 = [H11|T22], reverse(L222,R2),
	write('List1 : '),write(R1),nl,write('List2 : '),write(R2).


getTail([H|T],T1) :-
	T=[],T1 = H;
	getTail(T,T1).
putTail([H|T],Tail,L,Le) :-
	length(T,Len),
	(Len=0,append(Le,[Tail],L);
	 append(Le,[H],L1),putTail(T,Tail,L,L1)
	).
swapfl([H1|T1],[H2|T2]) :-
	getTail(T1,Tail1),
	getTail(T2,Tail2),
	putTail([H2|T1],Tail2,L1,[]),
	putTail([H1|T2],Tail1,L2,[]),
	write(L1),nl,write(L2).


