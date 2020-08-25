package src;

import lib.AbSolution;

/**
 * Using prime factorization,
 * We calculate the number of divisors by
 * simply multiplying all the (exponents + 1) for each prime factor
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// Create an array of primes using the sieve of Eratosthenes
		var arrayPrime = buildArrayPrime(7500);
		var triangleNumber = 0;
		var index = 1;
		while (true) {
			triangleNumber += index;

			// Divide by the same prime factor until indivisible, each time incrementing the exponent by 1
			// Once indivisible, multiply into the total number of divisors
			var dividend = triangleNumber;
			var divisorCount = 1;
			for (i in arrayPrime) {
				var exponent = 1;
				while (dividend % i == 0) {
					dividend = Std.int(dividend / i);
					exponent++;
				}
				divisorCount *= exponent;

				if (dividend == 1) {
					break;
				}
			}

			if (divisorCount > 500) {
				break;
			}
			index++;
		}
		trace('The first triangle number with over 500 divisors: $triangleNumber');
	}

	private function buildArrayPrime(number) {
		var array = [for (i in 0...number) true];
		var arrayPrime = [];
		array[0] = array[1] = false;
		for (i in 2...number) {
			if (array[i] == false) {
				continue;
			}

			arrayPrime.push(i);
			var multiple = i * i;
			while (multiple < number) {
				array[multiple] = false;
				multiple += i;
			}
		}
		return arrayPrime;
	}
}
