package src;

import lib.AbSolution;

class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var sumOfSquares = sumOfSquares(100);
		var squareOfSum = squareOfSum(100);
		trace('Sum of squares: $sumOfSquares, Square of sum: $squareOfSum');
		trace('The difference is ${squareOfSum - sumOfSquares}');
	};

	/**
	 * Compute the sum of all squares from 1 to the given number
	 * @param upperLimit
	 */
	public function sumOfSquares(upperLimit) {
		// Create temporary variable to hold the sum
		var numSum = 0;

		// Loop through from 1 to the given number
		for (i in 1...upperLimit + 1) {
			// Square the current loop index
			// Add it to the temporary variable
			numSum += i * i;
		}

		// Return the sum
		return numSum;
	}

	/**
	 * Compute the square of the sum from 1 to the given number
	 * @param upperLimit
	 */
	public function squareOfSum(upperLimit) {
		// Create temporary variable to hold the sum
		var numSum = 0;

		// Loop through from 1 to the given number
		for (i in 1...upperLimit + 1) {
			// Add it to the temporary variable
			numSum += i;
		}

		// Square the sum
		numSum *= numSum;
		// Return the sum
		return numSum;
	}
}
