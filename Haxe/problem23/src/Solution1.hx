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
		// 28123 sets the upper limit since above this value,
		// any number can be expressed by adding 2 abundant numbers
		var upperBound = 28123 + 1;

		// All prime numbers are deficient
		// Record all abundant numbers
		var abundantArray = [];
		for (i in 0...upperBound) {
			if (isPrime(i)) {
				continue;
			}
			if (isAbundantNumber(i)) {
				abundantArray.push(i);
			}
		}

		// loop through all abundant numbers
		// record numbers that can be obtained by adding 2 abundant numbers
		// using a sieve
		// If the sum of two EQUAL abundant numbers > upperbound, we break early
		// (only works if sorted in ascending & starting from smallest)
		var sieveAbundantSum = [for (i in 0...upperBound) false];
		var isBeyondLimit = false;
		for (firstNumber in abundantArray) {
			if (isBeyondLimit) {
				break;
			}

			for (secondNumber in abundantArray) {
				var sum = firstNumber + secondNumber;
				if (sum < upperBound) {
					sieveAbundantSum[sum] = true;
				} else {
					isBeyondLimit = firstNumber == secondNumber ? true : false;
					break;
				}
			}
		}

		// get all false indexes from the sieve
		var sumCannotAdd2Abundant = 0;
		for (i in 0...sieveAbundantSum.length) {
			if (sieveAbundantSum[i] == false) {
				sumCannotAdd2Abundant += i;
			}
		}
		trace('The sum of the integers: $sumCannotAdd2Abundant');
	}

	public function isAbundantNumber(number) {
		var sum = 0;
		for (i in 0...number) {
			if (number % i == 0) {
				sum += i;
			}
		}
		if (sum > number) {
			return true;
		}
		return false;
	}

	private function isPrime(number) {
		for (i in 2...number) {
			if (number % i == 0) {
				return false;
			}
		}
		return true;
	}
}
