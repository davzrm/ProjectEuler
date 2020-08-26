package src;

import sys.io.File;
import lib.AbSolution;

using StringTools;

/**
 * Add from the last place value,
 * Then take whatever spill over and add it to the next place value.
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var arrayString = generateArrayNumberString();
		var arrayDigitSum = [];

		// Start from the last digit
		var lastDigitIndex = arrayString[0].length - 1;
		var number = 0;
		while (true) {
			// Add every digit of that place value in every number
			for (numberString in arrayString) {
				number += Std.parseInt(numberString.charAt(lastDigitIndex));
			}

			// Divide by 10, push the remainder into an array
			// Add the quotient to the next place value
			var remainder = number % 10;
			arrayDigitSum.unshift(remainder);

			number = Math.floor(number / 10);
			lastDigitIndex--;

			if (lastDigitIndex < 0) {
				while (number > 0) {
					var remainder = number % 10;
					arrayDigitSum.unshift(remainder);

					number = Math.floor(number / 10);
				}
				break;
			}
		}

		var totalString:String = '';
		for (i in 0...10) {
			totalString += arrayDigitSum[i];
		}
		trace('The first ten digits are: $totalString');
	}

	private function generateArrayNumberString() {
		var string = File.getContent("source.txt");
		var whiteSpaceRegex = ~/\s+/g;
		var array = [
			for (i in whiteSpaceRegex.split(string))
				i
		];

		return array;
	}
}
