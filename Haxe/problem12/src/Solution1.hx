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

			// Then find all its factors & push them into array
			var divisorCount = 0;
			for (i in 1...Math.ceil(Math.sqrt(triangleNumber))) {
				if (triangleNumber % i == 0) {
					divisorCount++;
				}
			}

			// Check if the array has over 500 factors
			if (divisorCount * 2 > 500) {
				break;
			}
			index++;
		}

		trace('The first triangle number with over 500 divisors: $triangleNumber');
	}
}
