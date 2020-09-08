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
		var upperBound = 100;
		var digitArray = [1];
		var index = 1;
		while (index <= upperBound) {
			// Multiply each digit in the array with the index
			var digitIndex = digitArray.length - 1;
			var spillOver = 0;
			while (digitIndex >= 0) {
				// Every place value spill over will be recorded
				// & added to the next element in the array
				var product = digitArray[digitIndex] * index + spillOver;
				digitArray[digitIndex] = product % 10;
				spillOver = Math.floor(product / 10);

				// When we're out of elements to add to
				// We'll insert the spill over to the beginning of the array instead
				if (digitIndex == 0) {
					while (spillOver > 0) {
						var remainder = spillOver % 10;
						digitArray.unshift(remainder);
						spillOver = Math.floor(spillOver / 10);
					}
				}
				digitIndex--;
			}
			index++;
		}

		var sumOfDigits = 0;
		for (i in digitArray) {
			sumOfDigits += i;
		}
		trace('The sum of the digits: $sumOfDigits');
	}
}
