package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * Using the sieve of Eratothenes &
 * the upper bound formula for the nth prime number
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var upperBound = upperBoundForPrimeNumber(10001);
		var sieve = [for (i in 0...upperBound + 1) true];
		sieve[0] = sieve[1] = false;

		var arrayPrime = [];
		for (index in 2...upperBound + 1) {
			if (sieve[index] == false) {
				continue;
			}

			arrayPrime.push(index);

			var multiple = index * index;
			while (multiple <= upperBound && multiple > 0) {
				sieve[multiple] = false;
				multiple += index;
			}
		}

		trace('The 10001st prime number is ${arrayPrime[10001]}');
	}

	private function upperBoundForPrimeNumber(number) {
		if (number < 6) {
			return 100;
		}

		var upperbound = Math.ceil(number * (Math.log(number) + Math.log(Math.log(number))));
		return upperbound;
	}
}
