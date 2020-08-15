package src;

import haxe.Timer;

class Solution2 {
	var upperLimit = 0;
	var sumOfMultiple3 = 0;
	var sumOfMultiple5 = 0;
	var sumOfMultiple15 = 0;

	public function new(upperLimit = 1000) {
		var timeStamp1 = Timer.stamp();
		this.upperLimit = upperLimit;
		var sum3 = getSumOfMultiple(3);
		var sum5 = getSumOfMultiple(5);
		var sum15 = getSumOfMultiple(15);

		trace('The final answer is $sum3 + $sum5 - $sum15 = ${sum3 + sum5 + sum15}');
		var timeStamp2 = Timer.stamp();

		trace('Time taken: ${timeStamp2 - timeStamp1}\n');
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
		// Loop through the number line starting from 1 & add to array
		var arrayPlaceholder = [
			for (i in 1...upperLimit)
				if (i % multiple == 0) i
		];

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
