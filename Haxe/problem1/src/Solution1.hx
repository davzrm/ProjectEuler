package src;

import lib.AbSolution;

class Solution1 extends AbSolution {
	var upperLimit = 0;
	var sumOfMultiple3 = 0;
	var sumOfMultiple5 = 0;
	var sumOfMultiple15 = 0;

	public function new() {
		super();
	}

	override function computeSolution() {
		this.upperLimit = 1000;
		var sum3 = getSumOfMultiple(3);
		var sum5 = getSumOfMultiple(5);
		var sum15 = getSumOfMultiple(15);

		trace('The final answer is $sum3 + $sum5 - $sum15 = ${sum3 + sum5 - sum15}');
	}

	/**
	 * Traces the whole solution onto the console
	 * @param multiple
	 */
	private function getSumOfMultiple(multiple) {
		// create an array of multiples
		var array = listSeriesMultiple(multiple, upperLimit);
		// print array to console
		trace('The list of numbers with the multiple of $multiple:\n$array');

		// get sum of array
		var sum = sumOfSeries(array);
		// print sum to console
		trace('The sum of the series of multiple $multiple: $sum\n');

		// return sum of array
		return sum;
	}

	/**
	 * Retrieve a list of numbers of a common multiple.
	 * @param multiple
	 * @param upperLimit
	 * @return Array<Int>
	 */
	private function listSeriesMultiple(multiple:Int, upperLimit:Int):Array<Int> {
		// Declare temporary placeholder
		var arrayPlaceholder = [];

		// Loop through the number line starting from 1 & append numbers of common multiple to placeholder.
		for (i in 1...upperLimit) {
			if (i % multiple == 0) {
				arrayPlaceholder.push(i);
			}
		}

		// Return array
		return arrayPlaceholder;
	}

	/**
	 * Takes a an array of numbers, and adds all them together.
	 * @param series
	 * @return Int
	 */
	private function sumOfSeries(series:Array<Int>):Int {
		// Declare temporary placeholder
		var sum = 0;

		// Loop through the series and totals
		for (i in series) {
			sum += i;
		}
		// Return sum
		return sum;
	}
}
