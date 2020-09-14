package src;

import haxe.display.Protocol.Timer;
import lib.AbSolution;

/**
 * Another sieve?
 * Once we have located an abundant number,
 * All multiples of that abundant number will also be abundant.
 *
 * ex.Proper divisors of 12 => 1,2,3,4,6
 * 1 + 2 + 3 + 4 + 6 > 12 ... [1]
 *
 * If we multiply both sides of [1] by any positive integer, K...
 * (1 + 2 + 3 + 4 + 6 ) * K > (12 * K )
 * The left side will still be more than the right.
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var upperBound = 28123 + 1;
		var primeSieve = computeSieve(upperBound);

		var abundantNumberSieve = [for (i in 0...upperBound) false];
		for (i in 0...upperBound) {
			if (abundantNumberSieve[i] == true || primeSieve.contains(i)) {
				continue;
			}

			if (isAbundantNumber(i, primeSieve)) {
				abundantNumberSieve[i] = true;

				var multiple = i + i;
				while (multiple < upperBound && multiple > 0) {
					abundantNumberSieve[multiple] = true;
					multiple += i;
				}
			}
		}
		var abundantArray = [
			for (i in 0...abundantNumberSieve.length)
				if (abundantNumberSieve[i] == true) {
					i;
				}
		];

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

		var sumCannotAdd2Abundant = 0;
		for (i in 0...sieveAbundantSum.length) {
			if (sieveAbundantSum[i] == false) {
				sumCannotAdd2Abundant += i;
			}
		}
		trace('The sum of the integers: $sumCannotAdd2Abundant');
	}

	public function isAbundantNumber(number, sieve:Array<Int>) {
		if (number == 0) {
			return false;
		}

		var sum = 1;
		var remainder = number;
		for (primeNumber in sieve) {
			if (remainder == 1) {
				break;
			}
			if (primeNumber * primeNumber > remainder) {
				sum = sum * (remainder * remainder - 1);
				sum = Std.int(sum / (remainder - 1));
				break;
			}

			var exponent = 0;
			while (remainder % primeNumber == 0 && remainder > 1) {
				remainder = Std.int(remainder / primeNumber);
				exponent++;
			}
			if (exponent > 0) {
				var powerOfPrime = primeNumber * primeNumber;
				for (i in 1...exponent) {
					powerOfPrime *= primeNumber;
				}
				sum = sum * (powerOfPrime - 1);
				sum = Std.int(sum / (primeNumber - 1));
			}
		}
		sum = sum - number;
		if (sum > number) {
			return true;
		}
		return false;
	}

	public function computeSieve(upperBound) {
		var primeArray = [for (i in 0...upperBound) true];
		var tempArray = [];
		primeArray[0] = primeArray[1] = false;
		for (i in 2...primeArray.length) {
			if (primeArray[i] == false) {
				continue;
			}

			tempArray.push(i);
			var multiple = i;
			while (multiple < upperBound && multiple > 0) {
				primeArray[multiple] = false;
				multiple += i;
			}
		}
		return tempArray;
	}
}
