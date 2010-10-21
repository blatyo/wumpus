% Many paths

  % % % %
% _ _ _ G %
% _ _ _ _ %
% _ _ _ _ %
% S _ _ _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

glint([4,4]).

stench(X) :-
	false.
breeze(X) :-
	false.