package src;

import lib.AbSolution;

/**
 * We can use the Sum of Prime Factors Method from Problem 21
 * to compute abundant numbers.
 * (Notice that we're simply calculating d(n) from Problem 21)
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var upperBound = 28123 + 1;

		var primeSieve = computeSieve(upperBound);

		var abundantArray = [];
		for (i in 0...upperBound) {
			if (primeSieve.contains(i)) {
				continue;
			}

			// Apply the Sum of Prime Factors here.
			// NOTE: It is important that the function be able to handle 0,
			// if 0 is treated as an abundant number,
			// our final answer will be lower.
			// since we'll end up having more values that are sums of 2 abundant numbers (0 + anything)
			if (isAbundantNumber(i, primeSieve)) {
				abundantArray.push(i);
			}
		}

		var sumAbundantSieve = [for (i in 0...upperBound) false];
		var isBeyondLimit = false;
		for (firstNumber in abundantArray) {
			if (isBeyondLimit) {
				break;
			}

			for (secondNumber in abundantArray) {
				var sum = firstNumber + secondNumber;
				if (sum < upperBound) {
					sumAbundantSieve[sum] = true;
				} else {
					isBeyondLimit = firstNumber == secondNumber ? true : false;
					break;
				}
			}
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
