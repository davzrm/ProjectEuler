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
		var sum = 1000;
		// The maximum of a is 1/3 of the sum &
		// The maximum of b is 1/2 of the sum
		// Any higher will cause the sum of all three to be more than 1000
		// Since a < b < c
		var limitA = Math.floor(sum / 3);
		var limitB = Math.floor(sum / 2);

		var numA = 0;
		var numB = 0;
		var numC = 0;
		var isFound = false;

		for (numberA in 1...limitA) {
			for (numberB in (numberA + 1)...limitB) {
				var numberC = sum - numberA - numberB;
				var sumOfSquares = numberA * numberA + numberB * numberB;
				if (sumOfSquares == numberC * numberC) {
					numA = numberA;
					numB = numberB;
					numC = numberC;

					isFound = true;
				}
			}

			if (isFound) {
				break;
			}
		}

		trace('The pythagorean triple, A = $numA, B = $numB, C = $numC');
	}
}
