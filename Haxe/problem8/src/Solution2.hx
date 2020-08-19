package src;

import haxe.Int64;
import sys.io.File;
import lib.AbSolution;

/**
 * Brute Force Method
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

		var holderNum:Int64 = 1;
		var holderArray = [];
		var largestProduct:Int64 = 0;
		var largestArray = [];

		var adjacentNum = 13;
		for (i in 0...adjacentNum) {
			var digit = Std.parseInt(fileContent.charAt(i));
			holderNum *= digit;
			holderArray.push(digit);
		}

		var index = adjacentNum;
		while (index < fileContent.length) {
			// Load new digit & test if 0
			var newDigit = Std.parseInt(fileContent.charAt(index));

			// Test subsequent 13 digits
			if (newDigit == 0) {
				// Reset holder number
				holderNum = 1;
				holderArray = [];

				// Set index to the position AFTER the 0
				index++;
				var checkPoint = index;
				var resetSequence = index + adjacentNum;

				while (index < resetSequence) {
					var nextDigit = Std.parseInt(fileContent.charAt(index));

					// If 0, set index to the latest position of 0
					// Restart 0 test
					if (nextDigit == 0) {
						index++;
						resetSequence += (index - checkPoint);
						checkPoint = index;
						if (resetSequence < fileContent.length) {
							holderNum = 1;
							holderArray = [];
							continue;
						} else {
							break;
						}
					}
					holderNum *= nextDigit;
					holderArray.push(nextDigit);
					index++;
				}

				if (largestProduct < holderNum) {
					largestProduct = holderNum;
					largestArray = holderArray;
				}
				continue;
			}

			// Compare -- If new digit is more than old digit
			// Multiply current product with new digit
			// Divide current product by old digit
			var oldDigit = Std.parseInt(fileContent.charAt(index));
			holderNum = holderNum * newDigit / oldDigit;
			holderArray[index % adjacentNum] = newDigit;

			if (largestProduct < holderNum) {
				largestProduct = holderNum;
				largestArray = holderArray;
			}

			index++;
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
