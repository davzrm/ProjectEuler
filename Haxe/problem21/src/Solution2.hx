package src;

import lib.AbSolution;

/**
 * Brute force
 * together with the square root technique
 * that is, every divisor will have a counterpart
 * on the other side of the square root of the number
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var sumOfAmicableNumbers = 0;
		var amicableNumberArray = [];
		var upperBound = 10000;
		for (dividend in 2...upperBound) {
			// Skip all prime numbers
			// Skip all known amicable numbers
			if (isPrime(dividend) || amicableNumberArray.contains(dividend)) {
				continue;
			}

			var sumOfDivisor = sumOfDivisors(dividend);
			if (sumOfDivisor > dividend) {
				var newDividend = sumOfDivisor;
				sumOfDivisor = sumOfDivisors(newDividend);

				// Insert all amicable numbers to an array
				if (sumOfDivisor == dividend) {
					sumOfAmicableNumbers += dividend;
					sumOfAmicableNumbers += newDividend;
					amicableNumberArray.push(dividend);
					amicableNumberArray.push(newDividend);
				}
			}
		}
		trace('The sum of all amicable numbers under 10000: $sumOfAmicableNumbers');
	}

	private function sumOfDivisors(number) {
		// With square root technique
		var sumOfDivisor = 1;
		var squareRoot = Math.floor(Math.sqrt(number));
		if (number == squareRoot + squareRoot) {
			sumOfDivisor += squareRoot;
			squareRoot--;
		}
		for (divisor in 2...squareRoot) {
			if (number % divisor == 0) {
				sumOfDivisor = sumOfDivisor + divisor + Math.floor(number / divisor);
			}
		}
		return sumOfDivisor;
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
