:-[lists].

width(10).

dim(D) :- width(W), between(1,W,D).

list_named_sprites([none,wall,gem,altar]).

identifier(X,Y,I) :- I is (X+Y+X+Y+1)/2 + Y.

tile((X,Y)) :- dim(X), dim(Y).

adj((X1,Y1),(X2,Y2)) :-
  tile((X1,Y1)),
  tile((X2,Y2)),
  T1 is abs(X1-X2),
  T2 is abs(Y1-Y2),
  R is T1 + T2,
  R == 1.

start((1,1)).
finish((W,W)) :- width(W).

sprite((X,Y),R) :- identifier(X,Y,I),
                   list_named_sprites(List),
                   select_uniform(I, List, R,_).

query(sprite((X,Y),R)) :- tile((X,Y)).

one_altar :- findall((X,Y), (dim(X),dim(Y),sprite((X,Y), altar)),L),
             length(L,1).

one_gem :- findall((X,Y), (dim(X),dim(Y),sprite((X,Y), gem)),L),
            length(L,1).

evidence(one_altar).
evidence(one_gem).
