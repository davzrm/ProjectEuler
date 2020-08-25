package src;

import lib.AbSolution;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// Starting from the lowest number
		var triangleNumber = 0;
		var index = 1;
		while (true) {
			// Create the triangle number
			triangleNumber += index;

			// Square root the triangle number,
			// add an additional divisor to the total if a perfect square was found
			var root = Math.sqrt(triangleNumber);
			var additionalDivisor = root % 1 == 0 ? 1 : 0;

			var divisorCount = 0;
			for (i in 1...Math.ceil(root)) {
				if (triangleNumber % i == 0) {
					divisorCount++;
				}
			}

			divisorCount = (divisorCount * 2) + additionalDivisor;
			if (divisorCount > 500) {
				break;
			}
			index++;
		}

		trace('The first triangle number with over 500 divisors: $triangleNumber');
	}
}
