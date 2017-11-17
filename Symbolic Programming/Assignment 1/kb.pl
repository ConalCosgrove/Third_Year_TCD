numeral(0). 
numeral(succ(X))  :-  numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).



add2(X,Y,Z).
numeral(X), numeral(Y), numeral(Z) :- add(X,Y,Z).

