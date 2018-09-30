:- use_module(library(clpfd)).
 
mult(V1, V2, N) :- maplist(product,V1,V2,P), sumlist(P,N).
product(N1,N2,N3) :- N3 is N1*N2.

ajusta(M1, M2, M3) :- transpose(M2,MT), maplist(aux(MT), M1, M3).
aux(M2, I1, M3) :- maplist(mult(I1), M2, M3).

% mult([13,5,7,2,3],[2,4,6,2,1],Y).