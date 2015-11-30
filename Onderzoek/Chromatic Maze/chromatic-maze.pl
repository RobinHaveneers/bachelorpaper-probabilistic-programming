(1/6) :: tile(X, Y,red);
(1/6) :: tile(X, Y,yellow);
(1/6) :: tile(X, Y,green);
(1/6) :: tile(X, Y,cyan);
(1/6) :: tile(X, Y,blue);
(1/6) :: tile(X, Y,magenta).

% (1/6) :: color(red);
% (1/6) :: color(yellow);
% (1/6) :: color(green);
% (1/6) :: color(cyan);
% (1/6) :: color(blue);
% (1/6) :: color(magenta).



(1/6) :: sxco(1);
(1/6) :: sxco(2);
(1/6) :: sxco(3);
(1/6) :: sxco(4);
(1/6) :: sxco(5);
(1/6) :: sxco(6).

(1/6) :: syco(1);
(1/6) :: syco(2);
(1/6) :: syco(3);
(1/6) :: syco(4);
(1/6) :: syco(5);
(1/6) :: syco(6).

(1/6) :: fxco(1);
(1/6) :: fxco(2);
(1/6) :: fxco(3);
(1/6) :: fxco(4);
(1/6) :: fxco(5);
(1/6) :: fxco(6).

(1/6) :: fyco(1);
(1/6) :: fyco(2);
(1/6) :: fyco(3);
(1/6) :: fyco(4);
(1/6) :: fyco(5);
(1/6) :: fyco(6).

adjacent(X,Y,X+1,Y).
adjacent(X,Y,X-1,Y).
adjacent(X,Y,X1,Y+1).
adjacent(X,Y,X,Y-1).

next(red,yellow).
next(yellow,green).
next(green,cyan).
next(cyan,blue).
next(blue,magenta).
next(magenta,red).

ok(C,C) :- color(C).
ok(C1,C2) :- next(C1,C2).
ok(C1,C2) :- next(C2,C1).

passable(SX, SY, X, Y) :-
    adjacent(SX,SY, X, Y),
    tile(C1, SX, SY),
    tile(C2, X, Y).
    ok(C1,C2).

player_at(T, X, Y) :-
  time(T),
  player_at(T-1, SX, SY),
  passable(SX, SY, X, Y).

start_and_finish(Sx,Sy,Fx,Fy) :- Sx \== Fx,
                                 Sy \== Fy,
                                 sxco(Sx),syco(Sy),fxco(Fx), fyco(Fy).

%tile(X, Y, C) :- between(1,6,X), between(1, 6, Y), color(C).

query(tile(X,Y,C)) :- between(1,6,X), between(1, 6, Y).

%query(start_and_finish(A,B,C,D)).
