bSort([],[]).
bSort([X], Y) :- Y = [X].
bSort(Ts, Y) :-
	bubble(Ts,Ts), Y = Ts;
	bubble(Ts,Ps), bSort(Ps,Y).

bubble([],B) :- B = [].
bubble([X],B) :- B = [X].
bubble([X,Y|Ts],[Y|B]) :- Y < X, bubble([X|Ts],B).
bubble([X,Y|Ts],[X|B]) :- X =< Y, bubble([Y|Ts],B).

% bSort([2,6,1,8], Y).