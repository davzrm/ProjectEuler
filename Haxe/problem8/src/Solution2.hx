package src;

import haxe.Int64;
import sys.io.File;
import lib.AbSolution;

/**
 * Brute Force v.2
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	var fileContent = '';

	private override function computeSolution() {
		if (!canLoadFile()) {
			trace('Unable to load file');
			return;
		};

		// Split the long number into arrays at 0's
		// Remove lengths below 13
		var adjacentNum = 13;
		var splitString = fileContent.split('0');
		splitString = splitString.filter(str -> str.length >= adjacentNum);

		// Create temporary variable to hold largest product & array of the 13 factors
		var largestProduct:Int64 = 0;
		var largestArray = [];
		var holderNum:Int64 = 1;
		var holderArray = [];
		// Scan through each split array ---
		for (string in splitString) {
			holderNum = 1;
			holderArray = [];

			// Multiply the first 13 numbers & compare with the largest product
			for (charNum in 0...adjacentNum) {
				var newDigit = Std.parseInt(string.charAt(charNum));
				holderNum *= newDigit;
				holderArray.push(newDigit);
			}
			if (largestProduct < holderNum) {
				largestProduct = holderNum;
				largestArray = holderArray;
			}

			// Followed by multiplying the next number and divide the last number & compare with largest product
			for (charNum in adjacentNum...string.length) {
				var newDigit = Std.parseInt(string.charAt(charNum));
				var oldDigit = holderArray.shift();
				holderNum = holderNum * newDigit / oldDigit;
				holderArray.push(newDigit);

				if (largestProduct < holderNum) {
					largestProduct = holderNum;
					largestArray = holderArray;
				}
			}
		}

		trace('The 13 numbers are: $largestArray');
		trace('The greatest product is $largestProduct');
	}

	/**
	 * Loads number as string if file system can be accessed.
	 */
	private function canLoadFile() {
		#if sys
		fileContent = File.getContent("number.txt");
		return true;
		#end
		return false;
	}
}
