ok(C1,C2) :- next(C1,C2).
ok(C1,C2) :- next(C2,C1).

%NEXT
next(red,yellow).
next(yellow,green).
next(green,cyan).
next(cyan,blue).
next(blue,magenta).
next(magenta,red).


query(ok(red, blue)).
