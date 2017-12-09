/* Q1. Write a DCG that accepts strings of the form u2v where u and v are strings
over the alphabet {0, 1} such that the number of 0’s in u is the same as the
number of 1’s in v. */ 

s --> one,[0],one,s,zero,[1],zero.
s --> [2].
one --> [1],one.
one --> [1].
one --> [].
zero --> [0],zero.
zero --> [].


%Q2.%

s2([C1,N1,P1,C2,N2,P2,C3,N3,P3],[]) :-  s3([C1,N1,P1,C2,N2,P2,C3,N3,P3],[]),
										C1 \= C2,C2 \= C3, C3 \= C1,
										N1 \= N2,N2 \= N3, N3 \= N1,
										P1 \= P2,P2 \= P3, P3 \= P1.
s3 --> house,house,house.
house --> col,nat,pet.
col --> ['red'].
col --> ['blue'].
col --> ['green'].
nat --> ['english'].
nat --> ['japanese'].
nat --> ['spanish'].
pet --> ['jaguar'].
pet -->['snail'].
pet --> ['zebra'].



%Q3.%

mkList(0,[]).
mkList(I,[H|T]) :- H==I,mkList(succ(I),T).
