package src;

import lib.AbSolution;

/**
 * What're divisors without prime factorization?
 *
 * d(N) = the sum of all divisors less than N.
 * now, we have
 * t(N) = the sum of all divisors of N
 * meaning
 * t(N) = d(N) + N
 *
 * The reason we need t(N) is because
 * we need a Multiplicative formula...
 * that is, if N = A * B, where A & B are coprime,
 * 			then t(N) = t(A) * t(B)
 *
 * If we get the prime factorization of N,
 * we end up with,
 * 				N = (a ^ k) * (b ^ j) * ... * (last prime number ^ exponent)
 * then,
 * 				t(N) = t(a ^ k) * t(b ^ j) * ... * t(last prime number ^ exponent) -> [1]
 *
 * We know for a prime number,
 * 				t(a) = 1 + a
 * since, a prime number only has 2 divisors.
 *
 * What if they had exponents? (ex. a ^ k)
 * Then it would simply be
 * 				t(a ^ k) = 1 + a + a^2 + ... + a^k -> [2]
 *
 * & if we multiply both sides by A, we get
 * 				a * t(a ^ k) = a + a^2 + ... + a ^ (k+1) -> [3]
 *
 * Subtract (3) by (2), we get
 *			 	t(a ^ k) = (a ^ (k + 1)) - 1 / (a -1) -> [4]
 *
 * We could easily calculate t(N) by applying formula [4] to [1]
 * without actually trying to find the divisors of N.
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var sumOfAmicableNumbers = 0;
		var upperBound = 10000;
		var primeSieve = getSieve(upperBound);
		for (dividend in 2...upperBound) {
			var sumOfDivisors = sumPrimeFactor(dividend, primeSieve);
			if (sumOfDivisors > dividend) {
				var newDivided = sumOfDivisors;
				sumOfDivisors = sumPrimeFactor(newDivided, primeSieve);

				if (sumOfDivisors == dividend) {
					sumOfAmicableNumbers += newDivided + dividend;
				}
			}
		}

		trace('The sum of all amicable numbers under 10000: $sumOfAmicableNumbers');
	}

	public function sumPrimeFactor(number, sieve:Array<Int>) {
		var sum = 1;
		var remainder = number;
		for (primeNumber in sieve) {
			if (remainder == 1) {
				break;
			}
			// only a prime factor of exponent 1 left
			if (primeNumber * primeNumber > remainder) {
				sum = sum * (remainder * remainder - 1);
				sum = Std.int(sum / (remainder - 1));
				break;
			}

			// factorize number
			var exponent = 0;
			while (remainder % primeNumber == 0 && remainder > 1) {
				remainder = Std.int(remainder / primeNumber);
				exponent++;
			}
			// apply formula -> t(a) = a ^ (k+1) -1 / (a -1)
			if (exponent > 0) {
				var powerOfPrime = primeNumber * primeNumber;
				for (i in 1...exponent) {
					powerOfPrime *= primeNumber;
				}
				sum = sum * (powerOfPrime - 1);
				sum = Std.int(sum / (primeNumber - 1));
				// t(n) = t(a ^ k) * t(b ^ j) * ...
			}
		}
		// return the wanted formula, d(n) = t(n) - n
		return sum - number;
	}

	public function getSieve(upperBound) {
		var upperLimit = upperBound + 1;
		var sieve = [
			for (i in 0...upperLimit)
				true
		];
		sieve[0] = sieve[1] = false;

		var primeNumberArray = [];
		for (i in 0...sieve.length - 1) {
			if (sieve[i] == false) {
				continue;
			}

			primeNumberArray.push(i);
			var multiple = i * i;
			while (multiple < upperLimit) {
				sieve[multiple] = false;
				multiple += i;
			}
		}

		return primeNumberArray;
	}
}
