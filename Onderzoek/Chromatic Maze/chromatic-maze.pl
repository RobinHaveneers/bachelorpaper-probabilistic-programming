:-[lists].

%AUX FUNCTIONS
list_of_integers(L,U,R) :- findall(X,between(L,U,X), R).

%CONSTANTS
t_max(35).
min_sol(20).
max_sol(35).
size(6).

%DIM
dim(D) :- size(S),list_of_integers(1, S, R), select_uniform(id1,R,D,_).
tuple_of_dim(X, Y) :- size(S),list_of_integers(1, S, R), select_uniform(id1,R,X,_), select_uniform(id2,R,Y,_).

%TIME
time(T) :- t_max(S),list_of_integers(1, S, R), select_uniform(id2,R,T,_).

%ADJACENT
adjacent(X,Y,X+1,Y).
adjacent(X,Y,X-1,Y).
adjacent(X,Y,X1,Y+1).
adjacent(X,Y,X,Y-1).

%COLORS
color(C) :- select_uniform(id1, [red, yellow, green, cyan, blue, magenta],C,_).

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
start(X,Y) :- tuple_of_dim(X,Y).
% FINISH
finish(X,Y) :- tuple_of_dim(X,Y).

player_at(T, X, Y) :-
  time(T),
  player_at(T-1, SX, SY),
  passable(SX, SY, X, Y).

start_and_finish(Sx,Sy,Fx,Fy) :- Sx \== Fx,
                                 Sy \== Fy,
                                 sxco(Sx),syco(Sy),fxco(Fx), fyco(Fy).

%tile(X, Y, C) :- between(1,6,X), between(1, 6, Y), color(C).

%query(tile(X,Y,C)) :- between(1,6,X), between(1, 6, Y).

query(start(X,Y)).
query(finish(X,Y)).

%query(start_and_finish(A,B,C,D)).
