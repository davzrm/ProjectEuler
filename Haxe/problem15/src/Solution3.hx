package src;

import haxe.Int64;
import lib.AbSolution;

using StringTools;

/**
 * Combinatorics ---
 * Combination (Not permutation) --
 * Only down and right -
 *
 * Since in a grid (& it's given constraints), every path has a fixed number of moves
 * And every move has an equal number of down's & right's (HALF down, HALF right)
 * That means, we only have to use the combination formula
 * to calculate the number of ways we can fill only one of the directions
 * in a space twice of that direction amount.
 * Meaning, in N total moves, we calculate only N/2 of one direction. (Since the other direction will simply occupy the rest)
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var dimension = 20;
		// Combination formula is C(n,r) = n! / r! (n-r)! = (n - r + 1)! / r!
		// Because, n! / (n -r)! = (n - r + 1)!
		// In this case, we're just shaving away the trailing factorial from the dividend

		// Total number of moves, n = grid number * 2
		// number of moves for 1 direction, r = grid number

		var movesTotal = dimension * 2;
		var movesOneDirection = dimension;
		var totalPaths:Int64 = 1;

		for (i in 0...dimension) {
			totalPaths *= movesTotal - i;
			totalPaths /= i + 1;
		}

		trace('The number of paths are: $totalPaths');
	}
}
