package src;

import haxe.Int32;
import haxe.Int64;
import lib.AbSolution;

/**
 * Using the sieve of Eratosthenes
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// Create an array of two million entries, make all true
		var limit = 2000000;
		var arrayNumber = [for (i in 0...limit) true];

		// For every prime number,
		// Push prime number into array
		// set every number divisible by the prime number to false in the array.
		arrayNumber[0] = arrayNumber[1] = false;
		var arrayPrime = [];
		for (i in 2...limit) {
			if (arrayNumber[i] == false) {
				// trace(arrayNumber[262147]);
				continue;
			}

			arrayPrime.push(i);
			var multiple = i + i;
			while (multiple < limit && multiple > 0) {
				arrayNumber[multiple] = false;
				multiple += i;
			}
		}

		var sum:Int64 = 0;
		for (i in arrayPrime) {
			sum += i;
		}
		trace('The sum of all primes below two million: $sum');
	}
}
