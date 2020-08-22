package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var limit = 2000000;
		var sum = 0;
		for (i in 2...limit) {
			if (isPrime(i)) {
				sum += i;
			}
		}

		trace('The sum of all primes below two million: $sum');
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
