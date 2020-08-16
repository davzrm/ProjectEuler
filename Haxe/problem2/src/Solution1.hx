package src;

import haxe.Timer;

class Solution1 {
	public function new() {
		var timeStamp1 = Timer.stamp();
		trace(sumOfEvenFibonacci(buildFibonacci(4000000)));
		var timeStamp2 = Timer.stamp();
		trace('Time taken: ${timeStamp2 - timeStamp1}');
	}

	/**
	 * Retrieve an array of Fibonacci numbers.
	 * @param upperLimit
	 */
	public function buildFibonacci(upperLimit:Int) {
		// Create temp variables for the first and second value and the array as placeholder
		var placeholderArray = [1, 2];

		// Loop and append fibonacci numbers until the upperlimit
		while (true) {
			var lastElement = placeholderArray[placeholderArray.length - 1];
			var secondLastElement = placeholderArray[placeholderArray.length - 2];
			var nextElement = lastElement + secondLastElement;
			if (nextElement > upperLimit) {
				break;
			}
			placeholderArray.push(nextElement);
		}

		// Return temp array
		return placeholderArray;
	}

	/**
	 * Calculate the sum of all even numbers in a given Fibonacci array.
	 * @param array
	 */
	public function sumOfEvenFibonacci(array:Array<Int>) {
		// Create a temporary variable to hold the sum of the even numbers.
		var sum = 0;

		// Loop through array, add all even numbers to the sum.
		for (i in array) {
			if (i % 2 == 0) {
				sum += i;
			}
		}

		// Return sum.
		return sum;
	}
}
