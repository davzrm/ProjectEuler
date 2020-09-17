package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var term = 1000000;
		var permutationArray = computePermutation(numberString);

		if (permutationArray.length >= term) {
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
		// Get a string of the digits
		var digitStringArray = digitString.split('');

		// Sort them in descending order to retrieve the upper bound
		// Sort them in ascending order to retrieve the lower bound
		digitStringArray.sort((prevElement, nextElement) -> prevElement < nextElement ? 1 : -1);
		var upperBound:Int64 = Int64.parseString(digitStringArray.join(''));
		digitStringArray.reverse();
		var lowerBound = Std.parseInt(digitStringArray.join(''));

		// Create a dictionary,
		// every digit in the original number is a key
		// every value is a the number of occurences of the digit
		var verifyPermutationDict:Map<String, Int> = [];
		for (digit in digitStringArray) {
			verifyPermutationDict[digit] = verifyPermutationDict.exists(digit) ? verifyPermutationDict[digit]++ : 1;
		}

		var permutationArray = [];
		var index:Int64 = lowerBound;
		while (index <= upperBound) {
			var numberStringSplit = Std.string(index).split('');
			var tempMap = verifyPermutationDict.copy();

			var isPermutation = true;
			for (digit in numberStringSplit) {
				// If digit not in dictionary, or more than the count of digits in the original number
				if (!tempMap.exists(digit) || --tempMap[digit] < 0) {
					isPermutation = false;
					break;
				}
			}
			// Check if all digits in original number are used
			var placeValueCountDifference = digitStringArray.length - numberStringSplit.length;
			for (leadingZero in 0...placeValueCountDifference) {
				tempMap['0']--;
			}
			for (count in tempMap) {
				if (count != 0) {
					isPermutation = false;
					break;
				}
			}
			if (isPermutation) {
				permutationArray.push(index);
			}
			index++;
		}

		return permutationArray;
	}
}
