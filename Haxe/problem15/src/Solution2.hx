package src;

import haxe.Int64;
import lib.AbSolution;

using StringTools;

/**
 * Since the path can only go right or down,
 * we can simply count the number of paths by
 * starting from the bottom right (end point) &
 * count backwards.
 *
 * We know the 2 points adjacent to the end point only have 1 possible move
 * We also know that all the points along the bottom & right edges of the grid have 1 possible move each
 * As for every other point, we can calculate its number of possible moves by
 * adding the possible moves of the points immediately right & below it.
 *
 * ex. If we look at the point immediately diagonal to the end point,
 * the point right of that has 1 possible move (above the end point),
 * the point below it also has 1 possible move (left of end point),
 * therefore the point diagonal to the end point has 1 + 1 = 2 possible moves.
 * Now we repeat until we reach the starting point.
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// Create grid
		var dimension = 20;
		var arrayGrid:Array<Array<Int64>> = createGridPoints(dimension);

		// Set all the points along the bottom and right edges to have only 1 possible move
		for (i in 0...dimension + 1) {
			arrayGrid[dimension][i] = 1;
			arrayGrid[i][dimension] = 1;
		}

		// Calculate the next inner point closest to the end point
		var rowIndex = dimension - 1;
		while (rowIndex >= 0) {
			var columnIndex = dimension - 1;
			while (columnIndex >= 0) {
				arrayGrid[rowIndex][columnIndex] = arrayGrid[rowIndex + 1][columnIndex] + arrayGrid[rowIndex][columnIndex + 1];
				columnIndex--;
			}
			rowIndex--;
		}

		trace('The number of paths are: ${arrayGrid[0][0]}');
	}

	public function createGridPoints(dimension:Int):Array<Array<Int64>> {
		var points = dimension + 1;
		var array:Array<Array<Int64>> = [
			for (row in 0...points) [
				for (column in 0...points)
					0
			]
		];
		return array;
	}
}
