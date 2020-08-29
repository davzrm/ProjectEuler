package src;

import lib.AbSolution;

/**
 * Brute force method
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// Create temporary variable to hold count
		var primeNumCount = 0;
		var primeAnswer = 0;

		// Run through numbers starting from 2
		var index = 2;
		while (true) {
			// Test each number if it's prime, add to count if yes
			// Once the count reaches 10001, return the prime number
			if (isPrime(index)) {
				primeNumCount++;

				if (primeNumCount == 10001) {
					primeAnswer = index;
					break;
				}
			}
			index++;
		}
		trace('The 10001st prime number is $primeAnswer');
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
