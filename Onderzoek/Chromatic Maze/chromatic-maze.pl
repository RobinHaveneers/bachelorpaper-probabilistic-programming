:-[lists].

%AUX FUNCTIONS
list_of_integers(L,U,R) :- findall(X,between(L,U,X), R).
head([X | _], X).

%CONSTANTS
t_max(35).
min_sol(20).
max_sol(35).
size(6).
colors([red, yellow, green, cyan, blue, magenta]).

%DIM
dim(D) :- size(S),list_of_integers(1, S, R), select_uniform(id1,R,D,_).
sf_dim(Sx, Sy, Fx, Fy) :-
  size(S),
  list_of_integers(1, S, R),
  select_uniform(id1,R,Sx,Rx),
  select_uniform(id2,R,Sy,Ry),
  select_uniform(id3,Rx,Fx,_),
  select_uniform(id4,Ry,Fy,_).

%TIME
time(T) :- t_max(S),list_of_integers(1, S, R), select_uniform(id2,R,T,_).

%ADJACENT
adjacent(X,Y,X+1,Y).
adjacent(X,Y,X-1,Y).
adjacent(X,Y,X1,Y+1).
adjacent(X,Y,X,Y-1).

%COLORS
color(C) :- colors(Col),select_uniform(id1, Col,C,_).

%NEXT
next(red,yellow).
next(yellow,green).
next(green,cyan).
next(cyan,blue).
next(blue,magenta).
next(magenta,red).

%ALLOWABLE TRANSITIONS
ok(C,C) :- color(C).
ok(C1,C2) :- next(C1,C2).
ok(C1,C2) :- next(C2,C1).

%PASSABLE STEPS
passable(SX, SY, X, Y) :-
    adjacent(SX,SY, X, Y),
    tile(C1, SX, SY),
    tile(C2, X, Y).
    ok(C1,C2).

%TILES
tile(X,Y,C) :- color(C).
% START

start(X,Y) :- sf_dim(X,Y,_,_).
% FINISH
finish(X,Y) :- sf_dim(_,_,X,Y).

%PLAYER AT
player_at(0,X,Y) :- start(X,Y).
player_at(T, X, Y) :-
  time(T),
  player_at(T-1, SX, SY),
  passable(SX, SY, X, Y),
  list_of_integers(0,T,R).

%TIME OF COMPLETION
victory_at(T) :- finish(X,Y), player_at(T, X, Y).
%VICTORY
victory :- victory_at(T).
:- not victory.
:- victory_at(T), min_sol(M), T < M.
:- victory_at(T), max_sol(M), T > M.


query(tile(X, Y, C)) :- dim(X), dim(Y).
query(start(X,Y)).
query(finish(X,Y)).
%query(player_at(T,X,Y)) :- time(T).
