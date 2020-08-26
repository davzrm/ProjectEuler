package src;

import lib.AbSolution;

/**
 * Using the fact that the formula of the nth triangle number is:
 * n(n+1) /2
 * & the fact that n & (n+1) must be coprimes,
 * we can simply calculate the number of divisors by
 * first, dividing the even coprime by 2 (according to the top formula)
 * then, calculating the divisorCount for each coprime
 * finally, multiplying the 2 divisorCount's to get the total divisors
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var arrayPrime = buildArrayPrime(1000);
		var divisorCountTotal = 0;
		var divisorCountN = 1;
		var divisorCountNPlusOne = 1;

		var number = 1;
		var dividedNumber = 0; // This number represents the number after dividing 2 (according to the formula above)
		while (true) {
			if (number % 2 == 0) {
				dividedNumber = Std.int(number / 2);
				divisorCountN = getDivisorCount(dividedNumber, arrayPrime);
				divisorCountNPlusOne = getDivisorCount((number + 1), arrayPrime);
			} else {
				dividedNumber = Std.int((number + 1) / 2);
				divisorCountN = getDivisorCount(number, arrayPrime);
				divisorCountNPlusOne = getDivisorCount(dividedNumber, arrayPrime);
			}
			divisorCountTotal = divisorCountN * divisorCountNPlusOne;
			if (divisorCountTotal > 500) {
				break;
			}
			number++;
		}

		var triangleNumber = number * (number + 1) / 2;
		trace('The first triangle number with over 500 divisors: $triangleNumber');
	}

	private function getDivisorCount(number:Int, primeList:Array<Int>):Int {
		var dividend = number;
		var divisorCount = 1;
		for (i in primeList) {
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
		return divisorCount;
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
