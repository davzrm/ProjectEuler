package src;

import haxe.Int64;
import lib.AbSolution;

using StringTools;

/**
 * Brute force + caching
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberStartLongest = 1;
		var longestLength = 0;
		var upperBound = 1000000;

		var cacheDict:Map<String, Int> = ['1' => 1];
		for (i in 1...upperBound) {
			var tempArray = [];
			var number:Float = i;
			var length = 0;
			while (true) {
				// Push every uncached number into an tempArray if not in cache
				var numberString = Std.string(number);
				if (!cacheDict.exists(numberString)) {
					tempArray.push(number);

					if (number % 2 == 0) {
						number = number / 2;
					} else {
						number = number * 3 + 1;
					}
					length++;
				}
					// Once a sequence is found in cache,
					// For every pushed number, save each number as key, & the value as sequence count + cache count
				// Then break out of loop
				else {
					var tempLength = length;
					for (j in tempArray) {
						var key = Std.string(j);
						cacheDict[key] = tempLength + cacheDict[numberString];
						tempLength--;
					}
					break;
				}
			}

			var string = Std.string(i);
			if (longestLength < cacheDict[string]) {
				longestLength = cacheDict[string];
				numberStartLongest = i;
			}
		}

		trace('The longest chain is: $longestLength');
		trace('The starting number is: $numberStartLongest');
	}
}
