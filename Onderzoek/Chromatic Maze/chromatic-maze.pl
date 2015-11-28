(1/6) :: tile(X,Y,red);
(1/6) :: tile(X,Y,yellow);
(1/6) :: tile(X,Y,green);
(1/6) :: tile(X,Y,cyan);
(1/6) :: tile(X,Y,blue);
(1/6) :: tile(X,Y,magenta).

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

start_and_finish(Sx,Sy,Fx,Fy) :- Sx \== Fx,
                                 Sy \== Fy,
                                 sxco(Sx),syco(Sy),fxco(Fx), fyco(Fy).

query(tile(X,Y,C)) :- between(1,6,X), between(1,6,Y).
query(start_and_finish(A,B,C,D)).
