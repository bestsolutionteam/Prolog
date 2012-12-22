last1(L,X):-
	reverse(L,[H|_]),
	X = H.
last2([H|T],X) :-
	T=[],X = H;
	last2(T,X).

