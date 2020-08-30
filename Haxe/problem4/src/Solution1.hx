package src;

import lib.AbSolution;

/**
 * Brute force sort of,
 * all palindromes that have even-number of digits can be divided by 11,
 * & the highest number is 999 squared = 998001,
 * therefore the highest palindrome is 997799. (even-number of digits)
 * & the lowest palindrome is 106601. (also an even-number of digits)
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	override private function computeSolution() {
		// Create temporary variable to hold the biggest palindrome
		var holderNum = 0;
		var firstFactor = 0;
		var secondFactor = 0;

		// Calculate from 100 to 999
		for (firstNumber in 100...1000) {
			if (firstNumber % 11 != 0) {
				continue;
			}
			for (secondNumber in firstNumber...1000) {
				// For each product, assign the number to the temporary variable if it is palindrome
				var productNum = firstNumber * secondNumber;
				if (holderNum < productNum && isPalindrome(productNum)) {
					firstFactor = firstNumber;
					secondFactor = secondNumber;
					holderNum = productNum;
				}
			}
		}

		// Trace largest palindrome
		trace('The largest palindrome from multiplying two 3-digit numbers, $firstFactor & $secondFactor: $holderNum');
	}

	/**
	 * Test the given number to see if it is a palindrome
	 * @param number
	 */
	public function isPalindrome(number):Bool {
		// Convert number to String
		var numString = Std.string(number);

		// First check - test if number given has an even length
		if (numString.length % 2 != 0) {
			return false;
		}

		// Second check - use an array to check if palindrome exists
		var loopRange = Std.int(numString.length / 2);
		for (i in 0...loopRange) {
			// Test if current digit is equal to the corresponding digit from behind
			var currentDigit = numString.charAt(i);
			var correspondingDigit = numString.charAt(numString.length - 1 - i);
			if (currentDigit != correspondingDigit) {
				return false;
			}
		}

		return true;
	}
}
