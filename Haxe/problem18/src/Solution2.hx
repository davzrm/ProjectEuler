package src;

import sys.io.File;
import lib.AbSolution;

/**
 * Like the previous grid problem,
 * we know the path which can be taken from the top is either
 * the number directly below and left OR directly below and right.
 *
 * If we were to start from the bottom of the triangle,
 * pick a number & compare it to its direct sibling,
 * we can reduce the size of the triangle by adding the bigger one to the number above it,
 * then work our way up from there.
 */
class Solution2 extends AbSolution {
	var biggestSum = 0;

	public function new() {
		super();
	}

	private override function computeSolution() {
		var path = 'source.txt';
		var triangleString = File.getContent(path);
		var triangleArray = getTriangleArray(triangleString);
		var depth = getDepth(triangleString);

		// Starting from the bottom right
		// we use the depth to mark the working level
		// & calculate the index of each number
		var endLineIndex = triangleArray.length - 1;
		while (depth > 0) {
			// the count of numbers in each line is equal to the depth
			// therefore, we only compare (depth-1) times.
			for (i in 0...depth - 1) {
				var rigthIndex = endLineIndex - i;
				var rightChild = triangleArray[rigthIndex];
				var leftChild = triangleArray[rigthIndex - 1];

				if (rightChild > leftChild) {
					triangleArray[rigthIndex - depth] += rightChild;
				} else {
					triangleArray[rigthIndex - depth] += leftChild;
				}
			}
			endLineIndex -= depth;
			depth--;
		}

		trace('The maximum total: ${triangleArray[0]}');
	}

	private function getTriangleArray(string) {
		var regex = ~/\s+/g;
		var stringArray = regex.split(string);

		var array = [
			for (i in stringArray)
				Std.parseInt(i)

		];
		return array;
	}

	private function getDepth(string) {
		var regex = ~/\n/g;
		var tempArray = regex.split(string);

		var depth = tempArray.length;
		return depth;
	}
}
