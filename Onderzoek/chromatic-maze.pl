% Adding color facts
(1/6) :: color(red).
(1/6) :: color(yellow).
(1/6) :: color(green).
(1/6) :: color(cyan).
(1/6) :: color(blue).
(1/6) :: color(magenta).

(1/6) :: dim(1).
(1/6) :: dim(2).
(1/6) :: dim(3).
(1/6) :: dim(4).
(1/6) :: dim(5).
(1/6) :: dim(6).

(1/6) :: cell(C, X, Y) :- color(C), dim(X), dim(Y).

1 :: start(X,Y) :- dim(X), dim(Y).

1 :: finish(X,Y) :- dim(X), dim(Y).

% Not a good method. Try and wor out a better one.
