
ktau(A,B,T):-
C is 0,D is 0,E is 0,com(A,B,C,D,T,E).


com([],[],C,D,T,E):- T is 2*(C-D)/(E* (E-1)).

com([H2|T2],[H1|T1],C,D,T,E):- 
T2=[]->
F is (E+1),com([],[],C,D,T,F);
com2(H2,T2,H1,T1,C,D,T2,T1,T,E).

com2(_,[],_,[],C,D,Y,Z,T,E):-
F is (E+1),com(Y,Z,C,D,T,F).

com2(A1,[A2|T3],B1,[B2|T4],C,D,Y,Z,T,E):-
com3(A1,A2,B1,B2,C,D,Y,Z,T3,T4,T,E).

com3(A1,A2,B1,B2,C,D,Y1,Z1,T3,T4,T,E):-
(((A1<A2,B1<B2);(A1>A2,B1>B2))-> (C1 is (C+1),com2(A1,T3,B1,T4,C1,D,Y1,Z1,T,E)) ; (D1 is (D+1)),com2(A1,T3,B1,T4,C,D1,Y1,Z1,T,E)).
