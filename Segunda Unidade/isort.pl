iSort(L, LS) :- foldl(insert, [], L, LS).
  
foldl(_Pred, Val, [], Val).
foldl(Pred, Val, [H | T], Res) :-
	call(Pred, Val, H, Val1), foldl(Pred, Val1, T, Res).
 
insert([], N, [N]).
insert([H | T], N, [N, H|T]) :- N =< H, !.
insert([H | T], N, [H|L1]) :- insert(T, N, L1).

% iSort([10,3,7,2,5],Y).