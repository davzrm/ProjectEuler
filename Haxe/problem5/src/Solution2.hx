package src;

import haxe.Timer;

class Solution2 {
	public function new() {}

	public function getSolution() {
		var stamp1 = Timer.stamp();
		computeSolution();
		var stamp2 = Timer.stamp();
		trace('Time taken: ${stamp2 - stamp1}');
	}

	/**
	 * Find the smallest multiple
	 * evenly divisible by 1 to 20,
	 * by only multiplying numbers with
	 * the highest order after prime factorization
	 */
	private function computeSolution() {
		var multiplyMap = new Map<Int, Int>();

		for (divisor in 2...(20 + 1)) {
			var tempDivisor = divisor;
			var tempFactor = 2;
			trace(divisor);
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
						trace('current Divisor: $divisor, current array: $multiplyMap');
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
