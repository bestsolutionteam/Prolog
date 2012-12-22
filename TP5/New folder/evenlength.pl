evenlength([],N):-
	Nt is mod(N,2),
	(
	Nt=1,write(no);
	Nt=0,write(yes)
	).

evenlength([_|T],Ne) :- N1 is Ne+1,evenlength(T,N1).
evenlength(L) :- evenlength(L,0).
