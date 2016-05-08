:-[lists].
% Trying to create perfet mazes, mazes where every location is reachable without closed loops.
% Starting from the idea of trees.

width(3).

dim(D) :- width(W), between(1,W,D).

% Simple pairing function for unique identifier
identifier(X,Y,I) :- I is ((X+Y+X+Y+1)/2) + Y.

list_of_directions([(0,-1),(1,0),(-1,0),(0,1)]).

edge_parent((X,Y),Xp,Yp,L) :-
  identifier(X,Y,I),
  list_of_directions(List),
  select_weighted(I,L,List,(Xp,Yp),_).

%Handle bottom-right
parent(X,Y,Xp,Yp) :-
  width(Max),
  X == Max,
  Y == Max,
  identifier(X,Y,I),
  select_uniform(I,[(-1,0),(0,-1)],(Xp,Yp),_).

% Handle top-right
parent(X,Y,Xp,Yp) :-
  width(Max),
  X == Max,
  Y == 1,
  identifier(X,Y,I),
  select_uniform(I,[(-1,0),(0,1)],(Xp,Yp),_).

% Handle bottom-left
parent(X,Y,Xp,Yp) :-
  width(Max),
  X==1,
  Y==Max,
  identifier(X,Y,I),
  select_uniform(I, [(1,0),(0,-1)],(Xp,Yp),_).

% Handle all regular cases: no corners, no edges
parent(X,Y,Xp,Yp) :-
  width(Max),
  X \== 1, Y \== 1, X \== Max, Y \== Max,
  identifier(X,Y,I),
  list_of_directions(List),
  select_uniform(I,List,(Xp,Yp),_).

% Handle all tiles on left edge,
% except left bottom
parent(X,Y,Xp,Yp) :-
  width(Max),
  Y \== 1,
  Y \== Max,
  X == 1,
  edge_parent((X,Y),Xp,Yp,[1/3,1/3,0,1/3]).

% Handle all tiles on right edge,
% except bottom right and top right
parent(X,Y,Xp,Yp) :-
  width(Max),
  Y \== Max,
  Y \== 1,
  X == Max,
  edge_parent((X,Y),Xp,Yp,[1/3,0,1/3,1/3]).

% Handle all tiles on top edge,
% except top right and top left
parent(X,Y,Xp,Yp) :-
  width(Max),
  X \== 1,
  X \== Max,
  Y == 1,
  edge_parent((X,Y),Xp,Yp,[0,1/3,1/3,1/3]).

% Handle all tiles on botom edge,
% except bottom right and bottom left
parent(X,Y,Xp,Yp) :-
  width(Max),
  X \== 1,
  X \== Max,
  Y == Max,
  edge_parent((X,Y),Xp,Yp,[1/3,1/3,1/3,0]).

linked(1,1).
linked(X,Y) :- parent(X,Y,DX,DY),
               dim(X),
               dim(Y),
               T is X+DX, S is Y+DY,
               linked(T,S).

query(parent(X,Y,Xp,Yp)) :- dim(X), dim(Y),(X,Y) \== (1,1).
evidence(linked(X,Y)) :- dim(X),dim(Y),(X,Y) \== (1,1).
