:-[lists].
% Trying to create perfet mazes, mazes where every location is reachable without closed loops.
% Starting from the idea of trees.

width(2).

dim(D) :- width(W), between(1,W,D).

% Simple pairing function for unique identifier
identifier(X,Y,I) :- I is (X+Y+X+Y+1)/2 + Y.

list_of_directions([(0,-1),(1,0),(-1,0),(0,1)]).
list_of_corner_directions([(1,0),(0,-1),(0,1),(-1,0)]).

corner_parent((X,Y),Xp,Yp) :- identifier(X,Y,I),
                            list_of_corner_directions(List),
                            select_weighted(I,[0,1/2,0,1/2],List,(Xp,Yp),_).

xmin_parent((X,Y),Xp,Yp) :- identifier(X,Y,I),
                            list_of_directions(List),
                            select_weighted(I,[1/3,1/3,0,1/3],List,(Xp,Yp),_).

xmax_parent((X,Y),Xp,Yp) :- identifier(X,Y,I),
                            list_of_directions(List),
                            select_weighted(I,[1/3,0,1/3,1/3],List,(Xp,Yp),_).

ymin_parent((X,Y),Xp,Yp) :- Y == 1,
                            identifier(X,Y,I),
                            list_of_directions(List),
                            select_weighted(I,[0,1/3,1/3,1/3],List,(Xp,Yp),_).

ymax_parent((X,Y),Xp,Yp) :- identifier(X,Y,I),
                            list_of_directions(List),
                            select_weighted(I,[1/3,1/3,1/3,0],List,(Xp,Yp),_).

% Handle all regular cases: no corners, no edges
parent(X,Y,Xp,Yp) :- width(Max),
                     X \==1, Y\==1, X\==Max, Y\==Max,
                     identifier(X,Y,I),
                     list_of_directions(List),
                     select_uniform(I,List,(Xp,Yp),_).

% Handle bottom-right
parent(X,Y,Xp,Yp) :- width(X),
                     width(Y),
                     corner_parent((X,Y),Xp,Yp).

% Handle all tiles on left edge
parent(X,Y,Xp,Yp) :- X == 1,
                     xmin_parent((X,Y),Xp,Yp).

% Handle all tiles on right edge, except bottom right
parent(X,Y,Xp,Yp) :- width(X),
                     \+ width(Y),
                     xmax_parent((X,Y),Xp,Yp).

% Handle all tiles on top edge
parent(X,Y,Xp,Yp) :- Y==1,
                     X\==1,
                     \+ width(X),
                     ymin_parent((X,Y),Xp,Yp).

% Handle all tiles on botom edge, except bottom right
parent(X,Y,Xp,Yp) :- width(Y),
                     X \== 1,
                     \+ width(X),
                     ymax_parent((X,Y),Xp,Yp).

linked(1,1).
linked(X,Y) :- parent(X,Y,DX,DY),
               dim(X),
               dim(Y),
               T is X+DX, S is Y+DY,
               linked(T,S).

query(parent(X,Y,Xp,Yp)) :- dim(X), dim(Y),(X,Y) \= (1,1).
evidence(linked(X,Y)) :- dim(X),dim(Y),(X,Y) \= (1,1).
