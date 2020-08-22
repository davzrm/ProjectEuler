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
		var sum = 2;
		for (i in 2...limit) {
			if (i % 2 == 0) {
				continue;
			}
			if (isPrime(i)) {
				sum += i;
				trace('prime: $i, sum: $sum');
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
