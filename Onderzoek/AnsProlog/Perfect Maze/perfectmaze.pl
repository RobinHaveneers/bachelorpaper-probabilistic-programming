width(3).
dim(1..W) :- width(W).

%linked(1,1).
%linked(X,Y) :- parent(X,Y,DX,DY), linked(X+DX,Y+DY).
% :- dim(X);dim(Y), not linked(X,Y).

1 {parent(X,Y,0,-1);parent(X,Y,1,0);parent(X,Y,0,1);parent(X,Y,-1,0)} 1 :- dim(X), dim(Y), (X,Y) != (1,1).
