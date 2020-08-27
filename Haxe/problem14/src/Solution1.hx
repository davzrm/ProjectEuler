package src;

import lib.AbSolution;

using StringTools;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberStartLongest = 1;
		var longestLength = 0;
		var upperBound = 1000000;

		// Start from the first number
		for (i in 1...upperBound) {
			var number:Float = i;
			var length = 1;

			// Terminate when 1 is reached & compare lengths
			while (number != 1) {
				if (number % 2 == 0) {
					number = number / 2;
				} else {
					number = number * 3 + 1;
				}
				length++;
			}
			if (longestLength < length) {
				longestLength = length;
				numberStartLongest = i;
			}
		}

		trace('The longest chain is: $longestLength');
		trace('The starting number is: $numberStartLongest');
	}
}
