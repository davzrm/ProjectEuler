package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * Brute force
 * Verify permutation with sorting.
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var permutationArray = computePermutation(numberString);

		if (permutationArray.length >= 1000000) {
			trace('The millionth permutation is: ${Int64.toInt(permutationArray[999999])}');
		} else {
			trace('The last permutation is: ${Int64.toInt(permutationArray[permutationArray.length - 1])}');
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
		var digitStringVerify = digitStringArray.join('');
		var upperBound:Int64 = Int64.parseString(digitStringVerify);
		digitStringArray.reverse();
		var lowerBound = Std.parseInt(digitStringArray.join(''));

		var permutationArray = [];
		var index:Int64 = lowerBound;
		while (index <= upperBound) {
			var numberStringSplit = Std.string(index).split('');

			var placeValueCountDifference = digitStringArray.length - numberStringSplit.length;
			for (leadingZeros in 0...placeValueCountDifference) {
				numberStringSplit.push('0');
			}
			numberStringSplit.sort((prevElement, nextElement) -> prevElement < nextElement ? 1 : -1);
			var numberString = numberStringSplit.join('');
			if (digitStringVerify == numberString) {
				permutationArray.push(index);
			}
			index++;
		}

		return permutationArray;
	}
}
