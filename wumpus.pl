pit([X, Y]) :-
	NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(breeze([NNX, Y]); bump([X,Y], west)),
	(breeze([NPX, Y]); bump([X,Y], east)),
	(breeze([X, NNY]); bump([X,Y], south)),
	(breeze([X, NPY]); bump([X,Y], north)).

wumpus([X, Y]) :-
  NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(stench([NNX, Y]); bump([X,Y], west)),
	(stench([NPX, Y]); bump([X,Y], east)),
	(stench([X, NNY]); bump([X,Y], south)),
	(stench([X, NPY]); bump([X,Y], north)).

safe(X) :-
	not(pit(X)),
	not(wumpus(X)).

forward([[X, Y], D], M, forward) :-
	(D = east, NX is X + 1, not(bump([X, Y], D)), safe([NX, Y]), M = [[NX, Y], D]);
	(D = north, NY is Y + 1, not(bump([X, Y], D)), safe([X, NY]), M = [[X, NY], D]);
	(D = south, NY is Y - 1, not(bump([X, Y], D)), safe([X, NY]), M = [[X, NY], D]);
	(D = west, NX is X - 1, not(bump([X, Y], D)), safe([NX, Y]), M = [[NX, Y], D]).

left([[X, Y], D], M, left) :-
	(D = east, M = [[X, Y], north]);
	(D = north, M = [[X, Y], west]);
	(D = west, M = [[X, Y], south]);
	(D = south, M = [[X, Y], east]).

right([[X, Y], D], M, right) :-
	(D = west, M = [[X, Y], north]);
	(D = north, M = [[X, Y], east]);
	(D = east, M = [[X, Y], south]);
	(D = south, M = [[X, Y], west]).

opposite(forward, forward).
opposite(left, right).
opposite(right, left).

moves(X, M, S, O) :-
	(forward(X, M, S); right(X, M, S); left(X, M, S)),
	opposite(S, O).

member(X, [X|_]).
member(X, [_|CL]) :-
	member(X, CL).

move([X, _], [], _, [pickup, right, right], []) :-
	glint(X).
move([X, D], [M | P], CL, [S|F], [O|R]) :-
	not(glint(X)), % force pickup to reduce paths
	moves([X, D], M, S, O),
	not(member(M,CL)),
	move(M, P, [M|CL], F, R).

reverse([], X, X).
reverse([X|B], Y, R) :- 
	reverse(B, [X|Y], R).

join([], R, R).
join([X|F], R, [X|S]) :-
	join(F, R, S).

findPath(S) :-
	X = [[1,1], north],
	move(X, _, [X], F, B),
	reverse(B, [], R),
	join(F, R, S).