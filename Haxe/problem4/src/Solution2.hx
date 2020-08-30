package src;

import lib.AbSolution;

using StringTools;

abstract FirstHalf(Int) from Int {
	inline function new(i:Int) {
		this = i;
	}

	@:op(i > b)
	inline function greaterThan(b) {
		return this > b;
	}

	@:op(i--)
	inline function minus() {
		return this--;
	}

	public var palindrome(get, never):Int;

	inline function get_palindrome() {
		return makePalindrome(this);
	}

	inline function makePalindrome(i:Int) {
		var firstHalfString = Std.string(i);
		var buffer = new StringBuf();
		var index = firstHalfString.length - 1;
		while (index >= 0) {
			buffer.addChar(firstHalfString.fastCodeAt(index));
			index--;
		}
		return Std.parseInt(firstHalfString + buffer.toString());
	}
}

/**
 * The highest number is 999 squared = 998001,
 * therefore the highest palindrome is 997799.
 * & the lowest palindrome is 106601.
 *
 * Since we're only dealing with even digit palindromes,
 * we can start with constructing the palindrome first,
 * then find its factors.
 *
 * A few things to know:
 * 1) A factor must from 100 to 999.
 * 2) It will be enough to just check for one of the factors
 * Since, We know that a factor lower than the square root of a number
 * will have a corresponding factor higher than the square root of the number.
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	override private function computeSolution() {
		var firstFactor = 0;
		var secondFactor = 0;
		var firstHalf:FirstHalf = 997;
		var isFound = false;
		while (true) {
			// Since we start from the biggest 3-digit number, we check if it is the bigger factor
			var firstNumber = 999;
			while (firstNumber >= 100) {
				var invalidFactor = firstHalf.palindrome / firstNumber > 999 || firstNumber * firstNumber < firstHalf.palindrome;
				if (!invalidFactor) {
					if (firstHalf.palindrome % firstNumber == 0) {
						firstFactor = firstNumber;
						secondFactor = Std.int(firstHalf.palindrome / firstNumber);
						isFound = true;
						break;
					}
				}
				firstNumber--;
			}

			if (isFound) {
				break;
			}
			firstHalf--;
		}
		trace('The largest palindrome from multiplying two 3-digit numbers, $firstFactor & $secondFactor: ${firstHalf.palindrome}');
	}
}
