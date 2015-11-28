(1/36) :: start(X,Y,C) :- tile(X,Y,C).

tile(4,6,yellow).
tile(1,5,cyan).
tile(2,1,red).
tile(3,3,blue).
tile(5,4,blue).
tile(4,1,magenta).
tile(5,2,yellow).
tile(3,2,cyan).
tile(1,6,blue).
tile(4,5,blue).
tile(3,4,red).
tile(3,1,magenta).
tile(1,4,green).
tile(3,5,red).
tile(5,5,blue).
tile(5,3,yellow).
tile(4,2,green).
tile(6,6,cyan).
tile(2,6,green).
tile(1,2,magenta).
tile(6,1,green).
tile(1,1,yellow).
tile(2,4,red).
tile(6,3,green).
tile(5,6,cyan).
tile(3,6,cyan).
tile(2,5,yellow).
tile(6,4,blue).
tile(1,3,yellow).
tile(6,5,green).
tile(4,3,yellow).
tile(5,1,magenta).
tile(2,3,green).
tile(6,2,yellow).
tile(2,2,red).
tile(4,4,red).

someStart :- tile(_,_,_).

query(someStart).
