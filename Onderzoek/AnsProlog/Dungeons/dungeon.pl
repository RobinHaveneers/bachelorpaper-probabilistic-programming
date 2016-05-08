width(8).
dim(1..W) :- width(W).
also_neg_dim(-W..W) :- width(W).

tile((X,Y)) :- dim(X), dim(Y).

adj((X1,Y1),(X2,Y2)) :-
 tile((X1,Y1)),
 tile((X2,Y2)),
 abs2(X1-X2,Abs1),
 abs2(Y1-Y2,Abs2),
 (Abs1+Abs2) == 1.

 adj2((X1,Y1),(X2,Y2)) :-
  tile((X1,Y1)),
  tile((X2,Y2)),
  abs2(X1-X2,Abs1),
  abs2(Y1-Y2,Abs2),
  (Abs1+Abs2) == 2.

abs2(X,Y) :- also_neg_dim(X),X < 0,Y = -X.
abs2(X,Y) :- also_neg_dim(X),X >= 0,Y = X.

start((1,1)).
finish((W,W)) :- width(W).

% tiles have at most one named sprite
0 { sprite(T,wall) ;gem(T); altar(T) } 1 :- tile(T).

% there is exactly one altar and one gem in the whole level
:- not 1 { altar(T) } 1.
:- not 1 { gem(T) } 1.
:- not (W*W)/2 {sprite(T,wall)}, width(W).
0 { sprite(T2,wall):adj(T1,T2) } 0 :- altar(T1).
0 { sprite(T2,wall):adj2(T1,T2) } 0 :- altar(T1).
:- altar(T1), not 4 { adj(T1,T2) }.
2 { sprite(T2,wall):adj(T1,T2) } :- sprite(T1,wall).
3 { sprite(T2,wall):adj(T1,T2) } :- gem(T1).


% you start in state 1
touch(T,1) :- start(T).
% possible navigation paths
{ touch(T2,2):adj(T1,T2) } :- touch(T1,1), gem(T1).
{ touch(T2,3):adj(T1,T2) } :- touch(T1,2), altar(T1).
{ touch(T2,S):adj(T1,T2) } :- touch(T1,S).
% you can’t touch a wall in any state
:- sprite(T,wall), touch(T,S).
% the finish tile must be touched in state 3
completed :- finish(T), touch(T,3).
:- not completed.
