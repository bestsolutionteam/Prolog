member(english,_).
member(spain,jaguar).
member(japan,_).

right_of(japan,N) :-
	member(N,snail),
	(
	\+ N=japan,member(N,snail)
	).

zebra(Who):-
	member(Who,zebra),
	right_of(japan,N),
	(
	\+ N=Who,member(Who,zebra)
	).



