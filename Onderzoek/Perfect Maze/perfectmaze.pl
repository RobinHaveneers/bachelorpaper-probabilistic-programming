:-[lists].
% Trying to create perfet mazes, mazes where every location is reachable without closed loops.
% Starting from the idea of trees.
width(5).

width(5).

dim(D) :- width(W), between(1,W,D).

% Simple pairing function for unique identifier
identifier(X,Y,I) :- I is (X+Y+X+Y+1)/2 + Y.

list_of_directions([(0,-1),(1,0),(-1,0),(0,1)]).

parent((X,Y),Xp, Yp) :- list_of_directions(List),
                        identifier(X,Y,I),
                        select_uniform(I,List, (Xp, Yp),_).


parent(X,Y,Xp,Yp) :- parent((X,Y),Xp, Yp).

query(parent(X,Y,Xp,Yp)) :-dim(X), dim(Y),(X,Y) \= (1,1).
