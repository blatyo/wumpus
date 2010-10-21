# Wumpus
## Usage
In SWI Prolog do:
    ['maze-file.pl', 'wumpus.pl'].
  
Then to enumerate over the solutions:
    findPath(P), write(P).

write is necessary because paths can become long and prolog suppresses long lists.

## Problem
Implement a Prolog program that solves Wumpus world games played on a 4x4 grid, returning the path from (1,1) to the gold bar if a safe path exists, and otherwise indicating no safe path can be found. Your program will solve games where the location of the percepts are provided in advance as a set of facts; this includes the locations of breezes, stenches, glints, and bumps. The specific location of the gold, pits and wumpus are unknown at the start of the game. In this version the player has no arrow (and thus the wumpus will still smell, but not scream). The player starts at (1,1) facing north, and may move forward, turn left, turn right, or grab the gold. Remember that the player must return to [1,1] with the gold to win the game.

Predicates for the percept facts are of the following forms: stench([1,1]), breeze([1,1]), glint([1,1]), bump([1,1],south), bump([1,1], west), where [1,1] is the (x,y) coordinate for a grid location, and wall locations are indicated using the constants north, south, east and west. Given a program defining a set of these facts, along with your set of facts and rules for solving games, define a predicate that may be used in a query to return a solution path starting from the entrance (1,1), or return false to indicate that no safe path to the gold exists.