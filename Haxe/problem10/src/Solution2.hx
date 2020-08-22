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
		var limit = 2000000;

		// Create an array of two million entries, make all true
		// For every prime number,
		// Push prime number into array
		// set every number divisible by the prime number to false in the array.
		var sum:Int64 = 0;
		var arrayNumber = [for (i in 0...limit) true];
		arrayNumber[0] = arrayNumber[1] = false;
		for (i in 2...limit) {
			if (arrayNumber[i] == false) {
				continue;
			}

			sum += i;
			var multiple = i + i;
			while (multiple < limit && multiple > 0) {
				arrayNumber[multiple] = false;
				multiple += i;
			}
		}

		trace('The sum of all primes below two million: $sum');
	}
}
