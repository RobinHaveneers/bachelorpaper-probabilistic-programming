:-[lists].
%AUX
list_of_integers(L,U,R) :- findall(M, between(L,U,M),R).

%CONSTANTS
t_max(35).
min_sol(20).
max_sol(35).
size(6).

dim(D) :- size(S), between(1,S,D).
dim_list(L) :- findall(N, dim(N), L).

random_coord(X,Y,I) :- dim_list(DL),
                       I2 is I/2,
                       select_uniform(I,DL, X,_),
                       select_uniform(I2,DL, Y,_).

time(T) :- t_max(M), between(0,M,T).

adjacent(X,Y,Nx,Y) :- dim(X), dim(Y), Nx is X+1.
adjacent(X,Y,Nx,Y) :- dim(X), dim(Y), Nx is X-1.
adjacent(X,Y,X,Ny) :- dim(X), dim(Y), Ny is Y+1.
adjacent(X,Y,X,Ny) :- dim(X), dim(Y), Ny is Y-1.

colors([red, yellow, green, cyan, blue, magenta]).
color(C) :- colors(L), member(C,L).

next(red,yellow).
next(yellow,green).
next(green,cyan).
next(cyan,blue).
next(blue,magenta).
next(magenta,red).

% next(C1, C2) :-
%   color(C1),
%   color(C2),
%   colors(L),
%   nth1(I,L,C1),
%   nth1(J,L,C2),
%   check_next(I,J,L).
%
% check_next(I,J,L) :-
%   length(L, T),
%   Len is T-1,
%   (
%   1 is abs(I-J);
%   Len is abs(I-J)
%   ).

ok(C,C) :- color(C).
ok(C1,C2) :- next(C1,C2).
ok(C1,C2) :- next(C2,C1).

passable(SX, SY, X, Y) :-
     adjacent(SX,SY,X,Y),
     tile(SX, SY, C1),
     tile(X, Y, C2),
     ok(C1,C2).

tile(X,Y,C) :- dim(X), dim(Y),colors(Lc), select_uniform(id(X,Y),Lc, C, _).
start(X,Y) :- random_coord(X,Y,1).
finish(X,Y) :- random_coord(X,Y,2).

player_at(0,X,Y) :- start(X,Y).
player_at(T, X, Y) :-
     time(T),
     T1 is T-1,
     player_at(T1, SX, SY),
     passable(SX, SY, X, Y),
     list_of_integers(0, T1, R),
     players_at(R, X, Y).

players_at([],_,_).
players_at([H|T], X, Y) :-
     \+ player_at(H, X, Y),
     players_at(T,X,Y).

victory_at(T) :- finish(X,Y), player_at(T, X, Y).
victory :- victory_at(T).
:- \+ victory.
:- victory_at(T), min_sol(M), T<M.
:- victory_at(T), max_sol(M), T>M.

tile_grid(S,S) :- size(S).
tile_char(X,Y,R) :-
  player_at(T,X,Y),
  R is (T mod 10),
  \+ start(X,Y),
  \+ finish(X,Y).

tile_char(X, Y, s) :- start(X,Y).
tile_char(X, Y, f) :- finish(X,Y).
tile_color(X,Y,C) :- tile(X,Y,C).

% query(victory).
% query(victory_at(T)):- time(T).
% %query(passable(A,B,C,D)) :- dim(A),dim(B),dim(C),dim(D).
%
query(start(X,Y)).
query(finish(X,Y)).
% query(player_at(T, X, Y)) :- time(T), dim(X), dim(Y).
% query(tile_grid(S,S)).
% query(tile_char(X,Y,T)) :- dim(X), dim(Y).
% query(tile_color(X,Y,C)).
