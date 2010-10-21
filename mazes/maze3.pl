% No path

  % % % %
% _ _ _ G %
% _ _ _ _ %
% W _ _ _ %
% S W _ _ %
  % % % %

% walls
bump([_,1], south).
bump([_,4], north).
bump([1,_], west).
bump([4,_], east).

stench([1,1]).
stench([2,2]).
stench([1,3]).
stench([3,1]).

glint([4,4]).