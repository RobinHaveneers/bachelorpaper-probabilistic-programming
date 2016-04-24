width(5).
dim(1..W) :- width(W).

% Handle all regulare cases: no corners, no edges
1 {parent(X,Y,0,-1);parent(X,Y,1,0);parent(X,Y,0,1);parent(X,Y,-1,0)} 1 :-
  width(Max),
  dim(X),
  dim(Y),
  dim(A),
  (X,Y) != (1,1),
  (X,Y) != (Max,Max),
  (X,Y) != (1,Max),
  (X,Y) != (Max,1),
  (X,Y) != (A,1),
  (X,Y) != (A,Max),
  (X,Y) != (1,A),
  (X,Y) != (Max,A).

% Handle bottom-right
1 {parent(X,Y,0,-1);parent(X,Y,-1,0)} 1 :-
  width(X),
  width(Y).

% Handle bottom-left
1 {parent(X,Y,0,-1);parent(X,Y,1,0)} 1 :-
  X==1,
  width(Y).

% Handle top-right
1 {parent(X,Y,0,1);parent(X,Y,-1,0)} 1 :-
  Y==1,
  width(X).

% Handle tiles on left edge except top left and bottom left
1 {parent(X,Y,0,-1);parent(X,Y,1,0);parent(X,Y,0,1)} 1 :-
  X == 1,
  not width(Y),
  (X,Y) != (1,1),
  dim(X),
  dim(Y).

% Handle tiles on right edge, except bottom and top right
1 {parent(X,Y,0,-1);parent(X,Y,-1,0);parent(X,Y,0,1)} 1 :-
  width(X),
  not width(Y),
  Y != 1,
  dim(X),
  dim(Y).

% Handle tiles on top edge, except top right and top left
1 {parent(X,Y,0,1);parent(X,Y,1,0);parent(X,Y,-1,0)} 1 :-
  Y == 1,
  X != 1,
  not width(X),
  dim(X),
  dim(Y).

% Handle tiles on bottom edge, except bottomm left and bottom right
1 {parent(X,Y,0,-1);parent(X,Y,1,0);parent(X,Y,-1,0)} 1 :-
  width(Y),
  X != 1,
  not width(X),
  dim(X),
  dim(Y).


linked(1,1).
linked(X,Y) :- parent(X,Y,DX,DY), linked(X+DX,Y+DY).
:- dim(X),dim(Y), not linked(X,Y).
