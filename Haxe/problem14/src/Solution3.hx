package src;

import lib.AbSolution;

abstract AbstractString(String) {
	inline function new(s:String) {
		this = s;
	}

	@:from static inline public function fromFloat(f:Float) {
		return new AbstractString(Std.string(f));
	}

	@:from static inline public function fromInt(i:Int) {
		return new AbstractString(Std.string(i));
	}
}

/**
 * Brute force + caching
 * Using the Abstract type from Haxe
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberStartLongest = 1;
		var longestLength = 0;
		var upperBound = 1000000;

		// The new abstract string is used on the map
		// Any float or int passed in to the key will be converted to string
		var cacheDict:Map<AbstractString, Int> = [1 => 1];
		for (i in 1...upperBound) {
			var tempArray = [];
			var number:Float = i;
			var length = 0;
			while (true) {
				// Floats passed in as keys become Strings
				if (!cacheDict.exists(number)) {
					tempArray.push(number);
					if (number % 2 == 0) {
						number = number / 2;
					} else {
						number = number * 3 + 1;
					}
					length++;
				} else {
					var tempLength = length;
					for (j in tempArray) {
						cacheDict[j] = tempLength + cacheDict[number];
						tempLength--;
					}
					break;
				}
			}

			// Ints passed in as keys become Strings
			if (longestLength < cacheDict[i]) {
				longestLength = cacheDict[i];
				numberStartLongest = i;
			}
		}

		trace('The longest chain is: $longestLength');
		trace('The starting number is: $numberStartLongest');
	}
}
