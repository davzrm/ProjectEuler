package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * The formula for the total number of permutations for a given number of objects,
 * 								N! / (N - R)! .... [1]
 * N = the given number of objects at hand
 * R = the number of objects required to make a permutation
 * ! is factorial
 *
 * We know that for this problem:
 * 1) The permutations must be sorted in ascending order.
 * 2) We only need the millionth permutation.
 * 3) All the digits are used in each permutation.
 *
 * If we lock the biggest place value,
 * & calculate the number of permutations for the remaining place values,
 * the permutation we want will have the digit in the locked place value,
 * if the term is less than the total number of permutations so far.
 *
 * For example, say we want the 3rd permutation of '198'.
 * - We lock the smallest digit in the biggest place value, '1'.
 * - Calculate total number of permutations for '45', which from formula [1], is 2.
 * - The total number so far is below than the permutation we want since 2 < 3rd
 * - So, we replace '1', with the next smallest digit, '8'
 * - Repeat the formula, and add the value to the previous total, which gives us 4.
 * - We now know that the 3rd permutation will have '8' in the biggest place value, since 4 > 3rd
 * - Move on to the next place value, and repeat.
 */
class Solution4 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var term = 1000000;
		var permutationNumber = computePermutation(numberString, term);

		if (permutationNumber != null) {
			trace('Permutation No.$term is: $permutationNumber');
		} else {
			throw 'Permutation out of range';
		}
	}

	public function computePermutation(digitString:String, permutationTerm) {
		var digitStringArray = digitString.split('');
		var placeValueCount = digitStringArray.length;
		var upperLimit = factorial(placeValueCount);
		if (permutationTerm > upperLimit || permutationTerm <= 0) {
			return null;
		}

		var digitCountArray = [for (i in 0...10) 0];
		for (digit in digitStringArray) {
			digitCountArray[Std.parseInt(digit)]++;
		}

		var number = [];
		var permutationTotal = 0;
		var index = placeValueCount;
		while (index > 0) {
			var isWithinRange = false;
			for (i in 0...10) {
				if (isWithinRange) {
					break;
				}
				if (digitCountArray[i] == 0) {
					continue;
				}

				var digitCount = digitCountArray[i];
				for (j in 0...digitCount) {
					var tempTotal = permutationTotal + factorial(index - 1);
					if (tempTotal > permutationTerm - 1) {
						digitCountArray[i]--;
						number.push(i);
						isWithinRange = true;
						break;
					}
					permutationTotal = tempTotal;
				}
			}
			index--;
		}

		return Int64.parseString(number.join(''));
	}

	public function factorial(number) {
		return number == 0 ? 1 : number * factorial(number - 1);
	}
}
