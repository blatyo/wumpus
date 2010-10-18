breeze([-1000, -1000]). % Nowhere in the universe. Needed so breeze isn't undefined.
pit([X, Y]) :-
	NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(breeze([NNX, Y]) | bump([X,Y], west)),
	(breeze([NPX, Y]) | bump([X,Y], east)),
	(breeze([X, NNY]) | bump([X,Y], south)),
	(breeze([X, NPY]) | bump([X,Y], north)).

stench([-1000, -1000]). % Nowhere in the universe. Needed so stench isn't undefined.
wumpus([X, Y]) :-
  NNX is X - 1, NPX is X + 1, NNY is Y - 1, NPY is Y + 1,
	(stench([NNX, Y]) | bump([X,Y], west)),
	(stench([NPX, Y]) | bump([X,Y], east)),
	(stench([X, NNY]) | bump([X,Y], south)),
	(stench([X, NPY]) | bump([X,Y], north)).

safe(X) :-
	not(wumpus(X)),
	not(pit(X)).

moves([X,Y], M) :-
	(			% east
		NX is X + 1,
		not(bump([X, Y], east)),
		safe([NX, Y]), 
		M = [NX, Y]
	) | (	% north
		NY is Y + 1,
		not(bump([X, Y], north)), 
		safe([X, NY]), 
		M = [X, NY]
	) | (	% south
		NY is Y - 1,
		not(bump([X, Y], south)), 
		safe([X, NY]), 
		M = [X, NY]
	) | (	% west
		NX is X - 1,
		not(bump([X, Y], west)),
		safe([NX, Y]),
		M = [NX, Y]
	).

member(X, [X|_]).
member(X, [_|CL]) :-
	member(X, CL).

move(X, [], _) :-
	glint(X).
move(X, [M|P], CL) :-
	moves(X, M),
	not(member(M,CL)),
	move(M, P, [M|CL]).

findPath([X|P]) :-
	X = [1,1],
	move(X, P, [X]).