qSort([], []).
qSort([H|U], S) :- 
    division(H, U, L, R), qSort(L, SL), qSort(R, SR), append(SL, [H|SR], S).
 
division(_, [], [], []).
division(H, [U|T], [U|LS], RS) :- U =< H, division(H, T, LS, RS).
division(H, [U|T], LS, [U|RS]) :- U  > H, division(H, T, LS, RS).

% qSort([13,5,7,2,3],Y).