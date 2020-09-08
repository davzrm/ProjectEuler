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
		var amicableNumberArray = [];
		var upperBound = 10000;
		for (dividend in 2...upperBound) {
			// Skip all prime numbers
			// Skip all known amicable numbers
			if (isPrime(dividend) || amicableNumberArray.contains(dividend)) {
				continue;
			}

			// Add all divisors
			var sumOfDivisor = 0;
			for (divisor in 1...dividend) {
				if (dividend % divisor == 0) {
					sumOfDivisor += divisor;
				}
			}

			// Sums that are larger than the dividend will repeat the process above
			// Check if the new sum is equal to the original dividend
			if (sumOfDivisor > dividend) {
				var newDividend = sumOfDivisor;
				sumOfDivisor = 0;
				for (divisor in 1...newDividend) {
					if (newDividend % divisor == 0) {
						sumOfDivisor += divisor;
					}
				}

				// Insert all amicable numbers to an array
				if (sumOfDivisor == dividend) {
					amicableNumberArray.push(dividend);
					amicableNumberArray.push(newDividend);
				}
			}
		}
		// Add all amicable numbers
		var sumOfAmicableNumbers = 0;
		for (i in amicableNumberArray) {
			sumOfAmicableNumbers += i;
		}
		trace('The sum of all amicable numbers under 10000: $sumOfAmicableNumbers');
	}

	public function isPrime(number) {
		for (i in 2...number) {
			if (number % i == 0) {
				return false;
			}
		}
		return true;
	}
}
