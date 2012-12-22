% OV is old value, NV is new value, OL old list, NL new list %

rep_elm(_,_,[],NL,NL).
rep_elm(OV,NV,[H|T],NL,NL1) :-
	(
	H=OV,L=[NV|NL1];
	L=[H|NL1]
	),
	rep_elm(OV,NV,T,NL,L).
rep_elm(OV,NV,OL,NL) :-
	rep_elm(OV,NV,OL,NLR,[]),
	reverse(NLR,NL).
