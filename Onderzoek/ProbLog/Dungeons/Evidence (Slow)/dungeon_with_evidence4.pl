:-[lists].

width(4).
minwall(1).
dim(D) :- width(W), between(1,W,D).

pairs(P) :-
  dim_list(L1),
  dim_list(L2),
  findall((A,B),
  (member(A, L1),member(B, L2)),P).

dim_list(L) :-
  findall(N, dim(N), L).

sprites([gem,altar,wall]).

identifier(X,Y,I) :- I is (X+Y+X+Y+1)/2 + Y.

tile((X,Y)) :- dim(X), dim(Y).

start((1,1)).
finish((W,W)) :- width(W).

tiles([],[]).
tiles([(X,Y)|T], [F|P]) :-
  sprite((X,Y),F),
  tiles(T, P).

sprite((X,Y),(X,Y,R)) :- sprites(List),
                         identifier(X,Y,I),
                         select_uniform(I, List, R,_).

only_one :-
  findall((X,Y),(tile((X,Y)),sprite((X,Y),(X,Y,gem))), R),
  length(R,1),
  findall((Z,Q), (tile((Z,Q)),sprite((Z,Q),(Z,Q,altar))), T),
  length(T,1).

query(tiles(P,R)) :- pairs(P).
evidence(only_one).
