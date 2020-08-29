package src;

import haxe.Int64;
import sys.io.File;
import lib.AbSolution;

/**
 * Brute Force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	var fileContent = '';

	private override function computeSolution() {
		if (!canLoadFile()) {
			trace('Unable to load file');
			return;
		};

		var adjacentNum = 13;
		var holderArray = [];
		var holderNum:Int64 = 1;
		for (i in 0...fileContent.length) {
			// Scan through every 13 adjacent numbers
			// Multiply them,
			// then compare with old
			var newNum:Int64 = 1;
			var newArray = [];
			for (charNum in i...i + adjacentNum) {
				var digit = Std.parseInt(fileContent.charAt(charNum));
				if (digit == 0) {
					break;
				}

				newNum *= digit;
				newArray.push(digit);

				if (newNum > holderNum) {
					holderNum = newNum;
					holderArray = newArray;
				}
			}
		}

		trace('The 13 numbers are: $holderArray');
		trace('The greatest product is $holderNum');
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
