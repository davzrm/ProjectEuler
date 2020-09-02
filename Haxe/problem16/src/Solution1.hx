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
		// Hold all potential digits in an array
		var arrayDigits = [2];
		var exponent = 1000;

		// Multiply all numbers in the array by 2
		for (i in 1...exponent) {
			var digitIndex = arrayDigits.length - 1;
			var spillOver = 0;
			while (digitIndex >= 0) {
				// Starting with the last digit
				var digit = arrayDigits[digitIndex];

				// Multiply 2
				// Replace old digit with modulus 10
				var product = digit * 2 + spillOver;
				arrayDigits[digitIndex] = product % 10;

				// If there is a spill over
				spillOver = Math.floor(product / 10);

				// Check if index is 0
				// If yes -> Unshift
				if (spillOver > 0 && digitIndex == 0) {
					arrayDigits.unshift(spillOver);
					spillOver = 0;
				}

				digitIndex--;
			}
		}

		trace('The digits of 2^1000 are :$arrayDigits');
		var sumDigits = 0;
		for (i in arrayDigits) {
			sumDigits += i;
		}
		trace('The sum of all the digits is: $sumDigits');
	}
}
