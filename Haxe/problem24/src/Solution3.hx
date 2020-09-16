package src;

import lib.AbSolution;

/**
 * Brute force
 * But with array, instead of Int64.
 * ('cause Int64 slow)
 */
class Solution3 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var permutationArray = computePermutation(numberString);

		if (permutationArray.length >= 1000000) {
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

		digitStringArray.sort((prevElement, nextElement) -> prevElement < nextElement ? 1 : -1);
		var upperBound:String = digitStringArray.join('');
		digitStringArray.reverse();
		var digitIntArray = digitStringArray.map(a -> Std.parseInt(a));

		var permutationArray = [];
		while (true) {
			var numberString = digitIntArray.join('');
			if (numberString > upperBound) {
				break;
			}

			// verify if it is a permutation
			// by comparing its digits to the upperbound's
			var copyArray = digitIntArray.copy();
			copyArray.sort((prevElement, nextElement) -> prevElement < nextElement ? 1 : -1);
			var tempString = copyArray.join('');
			if (tempString == upperBound) {
				permutationArray.push(numberString);
			}

			// have an array of integers
			// increment the singles place value
			// spill over when needed
			digitIntArray[digitIntArray.length - 1]++;
			var index = digitIntArray.length - 1;
			while (digitIntArray[index] >= 10) {
				digitIntArray[index] = 0;
				digitIntArray[index - 1]++;
				index--;
			}
		}

		return permutationArray;
	}
}
