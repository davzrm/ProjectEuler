package src;

import haxe.Int64;
import sys.io.File;
import lib.AbSolution;

using StringTools;

/**
 * Truncate an estimated amount of digits from the trailing side.
 * In a single place value, the highest digit is 9.
 * We have HUNDRED 50-digit numbers.
 * IF for all hundred numbers, the same place value for each number is occupied by 9,
 * THEN when we add all the 9's of the place value together, we get 900.
 * Two things are important to note:
 * 1) Only a SINGLE 9 gets added to 2 place values to the left.
 * 2) 0 now occupies the place value where the original 9 was.
 *
 * Since we are only interested in the first 10 digits,
 * we can safely remove the 13th digit onwards.
 * If the 11th & 12th digits of all hundred numbers are 9, the 9th & 10th digit needs to add an additional 9, respectively.
 * After adding the 11th & 12th digits, we have 0 occupying these spots.
 * So, if the 13th digit was also all 9's, adding them will simply put a 9 in that spot, never spilling over from the 11th.
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var arrayTrimNumber = generateTrimNumberArray();

		// Add all the first 15 numbers
		var total:Int64 = 0;
		for (i in arrayTrimNumber) {
			total += i;
		}

		// Then convert to string
		// Print only the first 10 digits
		var totalString = Int64.toStr(total).substr(0, 10);
		trace('The first ten digits are: $totalString');
	}

	private function generateTrimNumberArray() {
		var string = File.getContent("source.txt");
		var arrayTrimNumber = [
			for (i in string.split('\n'))
				Int64.parseString(i.substr(0, 12))
		];

		return arrayTrimNumber;
	}
}
