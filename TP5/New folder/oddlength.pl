oddlength([],N):-
	Nt is mod(N,2),
	(
	Nt=1,write(yes);
	Nt=0,write(no)
	).

oddlength([_|T],Ne) :- N1 is Ne+1,oddlength(T,N1).

oddlength(L) :- oddlength(L,0).
