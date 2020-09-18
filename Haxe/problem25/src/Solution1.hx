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
		var digitCountLimit = 1000;

		var prevNumber = [1];
		var nextNumber = [1];
		var term = 2;
		while (nextNumber.length < digitCountLimit) {
			// Match the total indexes on both the prev and next
			while (prevNumber.length < nextNumber.length) {
				prevNumber.unshift(0);
			}

			// Copy to set the new previous later
			var tempNumber = nextNumber.copy();
			var index = nextNumber.length - 1;
			var spillOver = 0;
			while (index >= 0) {
				var sum = nextNumber[index] + prevNumber[index] + spillOver;
				nextNumber[index] = sum % 10;
				spillOver = Math.floor(sum / 10);

				if (spillOver > 0 && index == 0) {
					// spill over will never be more than 10,
					// so there's no need to check additional times.
					var remainder = spillOver % 10;
					nextNumber.unshift(remainder);
				}
				index--;
			}
			prevNumber = tempNumber;
			term++;
		}

		trace('The first term with $digitCountLimit digits: ${nextNumber.join('')}, term number $term');
	}
}
