t_max(35).
min_sol(25).
max_sol(30).
size(5).

dim(1..S) :- size(S).
t(0..T) :- t_max(T).

adjacent(X,Y,X+1,Y):- dim(X), dim(Y).
adjacent(X,Y,X-1,Y):- dim(X), dim(Y).
adjacent(X,Y,X,Y+1):- dim(X), dim(Y).
adjacent(X,Y,X,Y-1):- dim(X), dim(Y).

color(red;yellow;green;cyan).

next(red,yellow).
next(yellow,green).
next(green,cyan).
next(cyan,red).

ok(C,C) :- color(C).
ok(C1,C2) :- next(C1,C2).
ok(C1,C2) :- next(C2,C1).

passable(SX,SY,X,Y) :-
  adjacent(SX,SY,X,Y),
  cell(C1,SX,SY),
  cell(C2,X,Y),
  ok(C1,C2).

1 {cell(Co,X,Y):color(Co)} 1:- dim(X), dim(Y).
1 {start(Xp,Yp):dim(Xp),dim(Yp)} 1.
1 {finish(Xp,Yp):dim(Xp),dim(Yp)} 1.

player_at(0,X,Y) :- start(X,Y).

player_at(T,X,Y) :-
  t(T),
  player_at(T-1,SX,SY),
  passable(SX,SY,X,Y),
  0 {player_at(0..T-1,X,Y)} 0.

victory_at(T) :- player_at(T,X,Y), finish(X,Y).

victory :- victory_at(T).

%:- victory_at(T), min_sol(MinSol),T < MinSol.
%:- victory_at(T), max_sol(MaxSol),MaxSol < T.

:- not victory.

tile_grid(S,S) :- size(S).

tile_char(X,Y,T\10) :- T > 0, player_at(T,X,Y), not start(X,Y), not finish(X,Y).
tile_char(X,Y,s) :- start(X,Y).
tile_char(X,Y,f) :- finish(X,Y).

tile_color(X,Y,C) :- cell(C,X,Y).
