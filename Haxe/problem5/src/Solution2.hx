package src;

import lib.AbSolution;
import haxe.Timer;

/**
 * Find the smallest multiple
 * evenly divisible by 1 to 20,
 * by only multiplying numbers with
 * the highest order after prime factorization
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	override private function computeSolution() {
		var multiplyMap = new Map<Int, Int>();

		for (divisor in 2...(20 + 1)) {
			var tempDivisor = divisor;
			var tempFactor = 2;
			while (tempFactor <= tempDivisor) {
				if (isPrime(tempFactor)) {
					var exponent = 0;
					while (tempDivisor > 1) {
						if (tempDivisor % tempFactor == 0) {
							exponent++;
							tempDivisor = Std.int(tempDivisor / tempFactor);
						} else {
							break;
						}
					}

					if (exponent >= 1) {
						if (multiplyMap[tempFactor] == null || multiplyMap[tempFactor] < exponent) {
							multiplyMap[tempFactor] = exponent;
						}
					}
				}
				tempFactor++;
			}
		}

		// Multiply all the objects with their exponent. /
		var smallestMultiple:Float = 1;
		for (key => value in multiplyMap) {
			smallestMultiple = smallestMultiple * Math.pow(key, value);
		}
		trace('The smallest multiple is $smallestMultiple');
	};

	private function isPrime(number) {
		for (i in 2...number) {
			if (number % i == 0) {
				return false;
			}
		}
		return true;
	}
}
