package src;

import lib.AbSolution;

/**
 * Brute force
 * Instead of running through each integer to the upper bound,
 * we go through the digits availabe instead.
 *
 * Warning: Recursion ahead.
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var term = 1000000;
		var permutationArray = computePermutation(numberString);

		if (permutationArray.length >= term) {
			trace('The millionth permutation is: ${permutationArray[999999]}');
		} else {
			trace('The last permutation is: ${permutationArray[permutationArray.length - 1]}');
		}
	}

	/**
	 * Returns an array of all it's permutations,
	 * with the assumption that all the digits are used in each permutation
	 * sorted in ascending order.
	 * @param digitString
	 */
	public function computePermutation(digitString:String) {
		var digitStringArray = digitString.split('');

		var digitCountArray = [for (i in 0...10) 0];
		for (digit in digitStringArray) {
			digitCountArray[Std.parseInt(digit)]++;
		}

		var permutationArray = [];
		var digitsAvailableCount = digitStringArray.length;
		var number = [];
		setDigit(digitCountArray, number, digitsAvailableCount, permutationArray);

		// permutationArray.sort((s1, s2) -> s1 > s2 ? 1 : -1);
		return permutationArray;
	}

	private function setDigit(digitCountArray, numberArray:Array<Int>, digitsAvailableLeft, permutationArray) {
		if (digitsAvailableLeft == 0) {
			permutationArray.push(numberArray.join(''));
			return;
		}

		for (digit in 0...10) {
			if (digitCountArray[digit] == 0) {
				continue;
			}

			var number = numberArray.copy();
			number.push(digit);
			var copyArray = digitCountArray.copy();
			copyArray[digit]--;
			var digitsLeft = digitsAvailableLeft - 1;
			setDigit(copyArray, number, digitsLeft, permutationArray);
		}
	}
}
