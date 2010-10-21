% One path

  % % % %
% _ _ _ _ %
% _ _ _ _ %
% W G _ _ %
% S _ P _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

stench([1,1]).
stench([1,3]).
stench([2,2]).

breeze([2,1]).
breeze([3,2]).
breeze([4,1]).

glint([2,2]).