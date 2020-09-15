package src;

import haxe.display.Protocol.Timer;
import lib.AbSolution;

/**
 * Another sieve?
 * Once we have located an abundant number,
 * All multiples of that abundant number will also be abundant.
 *
 * ex. Proper divisors of 12 => 1,2,3,4,6
 * 			1 + 2 + 3 + 4 + 6 > 12 ... [1]
 * If we multiply both sides of [1] by any positive integer, K...
 * 			(1 + 2 + 3 + 4 + 6 ) * K > (12 * K )
 * The left side will still be more than the right.
 * Using this, we can construct a sieve to skip checking the multiples of an abundant number.
 *
 *
 * To further optimize the solution during the computation of the sums of abundant numbers.
 * 1) We know that the multiple of a number is simply repeated sum of itself,
 * 								k * N = SUM(N) k times
 * which also means that the Sum of 2 multiples of N, is also a multiple of N.
 * Therefore, using the above method, we can skip checking the multiples of a number.
 *
 * 2) We only need to calculate the values of each number with their NON-multiple counterparts.
 * As we add two abundant numbers,
 * one number is bound to come across many multiples of the other number.
 * 						A + B, A + 2B, A + 3B... where A is NOT a multiple of B.
 * From induction,
 * 						A + B = 2B - (A - B),
 * ex, 2 + 3 = (2x2) + (3-2)
 * Meaning, we only need the difference between the 2 numbers,
 * then apply this difference to all multiples of either number.
 *
 * All this works because we have an upper bound.
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var upperBound = 28123 + 1;
		var primeSieve = computeSieve(upperBound);

		// Start recording the sum of 2 abundant numbers here.
		var sumAbundantSieve = [for (i in 0...upperBound) false];
		var numberAbundantSieve = [for (i in 0...upperBound) false];
		for (i in 0...upperBound) {
			if (numberAbundantSieve[i] == true || primeSieve.contains(i)) {
				continue;
			}

			if (isAbundantNumber(i, primeSieve)) {
				numberAbundantSieve[i] = true;

				var multiple = i + i;
				while (multiple < upperBound && multiple > 0) {
					// Every multiple is a sum.
					sumAbundantSieve[multiple] = true;
					numberAbundantSieve[multiple] = true;
					multiple += i;
				}
			}
		}
		var abundantArray = [
			for (i in 0...numberAbundantSieve.length)
				if (numberAbundantSieve[i] == true) {
					i;
				}
		];

		var pastNumberArray = [];
		for (currentIndex in 0...abundantArray.length) {
			var firstNumber = abundantArray[currentIndex];
			var isMultipleOfPastNumber = false;
			for (pastNumber in pastNumberArray) {
				if (firstNumber % pastNumber == 0) {
					isMultipleOfPastNumber = true;
					break;
				}
			}
			if (isMultipleOfPastNumber) {
				continue;
			}

			for (otherIndex in (currentIndex + 1)...abundantArray.length) {
				var secondNumber = abundantArray[otherIndex];
				if (secondNumber % firstNumber == 0) {
					continue;
				}

				var difference = secondNumber - firstNumber;
				// 2B + (B - A)
				var multiple = firstNumber + firstNumber + difference;
				while (multiple < upperBound && multiple > 0) {
					sumAbundantSieve[multiple] = true;
					multiple += firstNumber;
				}
			}
			pastNumberArray.push(firstNumber);
		}

		var sumCannotAdd2Abundant = 0;
		for (i in 0...sumAbundantSieve.length) {
			if (sumAbundantSieve[i] == false) {
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
