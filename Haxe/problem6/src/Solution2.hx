package src;

import lib.AbSolution;

class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	/**
	 * Use the power of arithmetic and compute the answer.
	 */
	private override function computeSolution() {
		var upperLimit = 100;
		var sumOfSquares = upperLimit * (upperLimit + 1) * (upperLimit * 2 + 1) / 6;
		var sumOfNumbers = upperLimit / 2 * (2 * 1 + (upperLimit - 1) * 1);

		var diff = sumOfNumbers * sumOfNumbers - sumOfSquares;
		trace('Sum of squares: $sumOfSquares, Square of sum: ${sumOfNumbers * sumOfNumbers}');
		trace('The difference is ${diff}');
	};
}
