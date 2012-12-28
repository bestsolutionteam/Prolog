unifiab([],_,Ans,Ans,_):-write('should give the answer : ').
unifiab([H|T],Term,Ans,La,Lw) :-
	\+ (H=Term),L2=[H|Lw],unifiab(T,Term,Ans,La,L2);
	L1=[H|La],unifiab(T,Term,Ans,L1,Lw).
unifiab(L,T,Ans) :- unifiab(L,T,Ans,[],[]).
