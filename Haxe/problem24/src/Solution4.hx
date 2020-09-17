package src;

import lib.AbSolution;

/**
 * Brute force?
 *
 * It is possible to get all the permutations for a given number of digits
 * by visualizing a shape with the number of corners = to the number of digits.
 *
 * By assiging digits to the corners of the shape,
 * one round around the shape from a corner gives one permutation,
 * repeating that for every corner
 * and the number of permutations will be equal to the number of digits x 2 (forwards and backwards).
 *
 * From there, all we need to do is to determine which points to change
 * to get a differet set of permutations, we do so with the following method:
 *
 * We fix a digit to one corner, let's call this the FIXED corner. This corner never changes.
 * Then only pay attention to the corners NOT connected to the corner we fixed, they are the CRITICAL corners.
 * The critical corners will determine the set of permutations we get.
 * The order of these corners DO matter.
 *
 * ex. For 'ABCDE',
 * - We draw a 5-corner shape, the corners are:
 * -   					A -> B -> C -> D -> E -> Back to A .... [1]
 * - We can get 10 permutations from [1]. (Forth & back)
 * - Fix 'A' in the first corner. (Fixed corner)
 * - The place values of 'C' & 'D' are not connected to 'A'. So these are the Critical corners.
 * - Notice if we swap the positions of 'C' & 'D', we get:
 * 						A -> B -> D -> C -> E -> Back to A ... [2]
 * - Another 10 permutations.
 * - If we swap 'E' & 'B' from [1], nothing happens, since it's just [2] backwards.
 *
 * Therefore, we only need to figure out the permutations of the critical corners,
 * to obtain all the permutations.
 *
 * Warning, Bad Joke ahead:
 * I call it the DZARM ShaPermu algorithm. (shape + permutation)
 * I'll leave here.
 *
 * And recursion ahead.
 */
class Solution4 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var numberString = '0123456789';
		var term = 1000000;
		var permutationArray = computePermutation(numberString);

		if (permutationArray.length >= term) {
			trace('Permutation No.$term is: ${permutationArray[term - 1]}');
		} else {
			trace('The last permutation is: ${permutationArray[permutationArray.length - 1]}');
		}
	}

	public function computePermutation(digitString:String) {
		var digitStringArray = digitString.split('');

		// Fix the smallest digit
		// Calculate Critical Corners = (max number of triangles in shape - 1)
		digitStringArray.sort((s1, s2) -> s1 > s2 ? 1 : -1);
		var digitsAvailableCount = digitStringArray.length;
		var criticalCornerCount = digitsAvailableCount > 3 ? digitsAvailableCount - 3 : 0;
		if (digitsAvailableCount == 1) {
			return digitStringArray;
		}

		// Reduce the smallest digit count by 1.
		var number = [for (i in 0...digitStringArray.length) -1];
		number[0] = Std.parseInt(digitStringArray.shift());
		var digitCountArray = [for (i in 0...10) 0];
		for (digit in digitStringArray) {
			digitCountArray[Std.parseInt(digit)]++;
		}

		var permutationArray = [];
		setDigit(digitCountArray, number, digitsAvailableCount, criticalCornerCount, permutationArray);

		permutationArray.sort((s1, s2) -> s1 > s2 ? 1 : -1);
		return permutationArray;
	}

	private function setDigit(digitCountArray, numberArray:Array<Int>, digitsAvailableLeft, criticalCornersLeft, permutationArray) {
		// After setting in the critical corners,
		// We compute the set of permutations
		if (digitsAvailableLeft == 0) {
			var number = numberArray.copy();
			var reverseNumber = numberArray.copy();
			reverseNumber.reverse();

			var index = 0;
			do {
				permutationArray.push(number.join(''));
				permutationArray.push(reverseNumber.join(''));
				number.push(number.shift());
				reverseNumber.push(reverseNumber.shift());
				index++;
			} while (numberArray.length > 2 && index < number.length);
			return;
		}

		for (digit in 0...10) {
			if (digitCountArray[digit] == 0) {
				continue;
			}

			// set the critical corners (2 -> last-1)
			var number = numberArray.copy();
			number[(number.length - 1) - criticalCornersLeft] = digit;

			// if the shape is a line or a triangle, 2 or 3 corners respectively,
			// we insert everything from the original countArray, only 1 cycle for them.
			var copyArray = number.length <= 3 ? digitCountArray : digitCountArray.copy();
			copyArray[digit]--;
			var digitsLeft = digitsAvailableLeft - 1;

			var emptyCriticalCorners = criticalCornersLeft - 1;
			if (emptyCriticalCorners <= 0) {
				// insert all remaining numbers after critical corners filled
				for (digit in 0...10) {
					if (copyArray[digit] != 0) {
						copyArray[digit]--;
						number[number.indexOf(-1)] = digit;
					} else if (number.indexOf(-1) == -1) {
						break;
					}
				}
				digitsLeft = 0;
			}
			setDigit(copyArray, number, digitsLeft, emptyCriticalCorners, permutationArray);
		}
	}
}
