%%% Probabilistic facts:
(1/6) :: een;
(1/6) :: twee;
(1/6) :: drie;
(1/6) :: vier;
(1/6) :: vijf;
(1/6) :: zes.

%%% Rules:
gooi_zes :- zes.
gooi_even :- twee; vier; zes.

%%% Queries:
query(gooi_zes).
query(gooi_even).
