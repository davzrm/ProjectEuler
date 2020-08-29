package src;

import haxe.Int64;
import lib.AbSolution;

using StringTools;

typedef GridPoint = {
	var coordinate:{var row:Int; var column:Int;};
	var goRight:Bool;
	var isRouteFixed:Bool;
	var endPath:Bool;
}

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	/**
	 * Create an object to represent each point in the path
	 * Each point will either point right or down
	 * Compute total number of paths
	 */
	private override function computeSolution() {
		var dimension = 20;
		var pathCount:Int64 = 0;
		var arrayPoint = createGridPoints(dimension);
		var isFinishedPathing = false;

		// From each point,
		while (true) {
			var rowIndex = 0;
			var columnIndex = 0;

			// Add each point to the beginning of a temp array
			// Follow the direction of each point until end
			var currentPoint = arrayPoint[rowIndex][columnIndex];
			var path = [currentPoint];
			while (!currentPoint.endPath) {
				if (currentPoint.goRight) {
					columnIndex++;
				} else {
					rowIndex++;
				}
				currentPoint = arrayPoint[rowIndex][columnIndex];
				path.unshift(currentPoint);
			}
			pathCount++;

			// Backtrack along the path, and switch the track of the first switch-able point
			// Reset all non-edge points to switch-able after the column of the switched point
			for (point in path) {
				if (!point.isRouteFixed) {
					point.isRouteFixed = true;
					point.goRight = false;
					resetInnerRoute(arrayPoint, dimension, point);
					break;
				} else if (point.coordinate.row == dimension && point.coordinate.column == 0) {
					isFinishedPathing = true;
				}
			} // End for

			// End outer loop once the bottom left corner if the grid is included
			if (isFinishedPathing) {
				break;
			}
		}

		trace('The number of paths are: $pathCount');
	}

	public function createGridPoints(dimension:Int) {
		var points = dimension + 1;
		var array:Array<Array<GridPoint>> = [
			for (row in 0...points) [
				for (column in 0...points) {
					var endColumn = column == points - 1;
					var endRow = row == points - 1;
					{
						coordinate: {row: row, column: column},
						goRight: endColumn ? false : true,
						isRouteFixed: endColumn || endRow ? true : false,
						endPath: endColumn && endRow ? true : false
					}
				}
			]
		];
		return array;
	}

	inline private function resetInnerRoute(array, dimension, point:GridPoint) {
		for (row in 1...dimension) {
			for (column in 1...dimension) {
				if (point.coordinate.column < column) {
					array[row][column].isRouteFixed = false;
					array[row][column].goRight = true;
				}
			}
		}
	}
}
