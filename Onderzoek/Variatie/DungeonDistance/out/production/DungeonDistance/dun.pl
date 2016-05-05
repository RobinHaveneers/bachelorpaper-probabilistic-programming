:-[lists].

width(7).
minwall(1).
dim(D) :- width(W), between(1,W,D).

pairs(P) :-
  dim_list(L1),
  dim_list(L2),
  findall((A,B),
  (member(A, L1),member(B, L2)),P).

dim_list(L) :-
  findall(N, dim(N), L).

regular_sprites([none,wall]).
special_sprites([gem,altar]).

identifier(X,Y,I) :- I is (X+Y+X+Y+1)/2 + Y.

tile((X,Y)) :- dim(X), dim(Y).

start((1,1)).
finish((W,W)) :- width(W).


tiles(H, (Ax, Ay), (Gx,Gy), Rest) :-
  get_special_gems(H, R, (Ax,Ay), (Gx, Gy)),
  get_regular_gems(R,Rest).

get_special_gems(H,R, (Ax, Ay), (Gx,Gy)) :-
  select_uniform(1, H,(Ax,Ay), R1),
  select_uniform(1, R1, (Gx, Gy),R),
  not((Ax,Ay)==(Gx, Gy)).

get_regular_gems([],[]).
get_regular_gems([(X,Y)|T], [F|Tail]) :-
  sprite((X,Y),F),
  get_regular_gems(T,Tail).

%sprite((X,Y),(X,Y,wall)).

sprite((X,Y),(X,Y,R)) :- regular_sprites(List),
                         identifier(X,Y,I),
                         select_uniform(I, List, R,_).

get_solution(Gem, Altar, Rest) :-
  pairs(P),
  tiles(P, Altar, Gem, Rest).

gem(G) :-
  get_solution(G,_,_).
altar(A) :-
  get_solution(_,A,_).
rest(R) :-
  get_solution(_,_,D),
  member(R,D).

query(gem(G)).
query(altar(A)).
query(rest(R)).
%evidence(half_walls).
