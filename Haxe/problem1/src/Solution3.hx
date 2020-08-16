package src;

import haxe.Timer;

class Solution3 {
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

		trace('The final answer is $sum3 + $sum5 - $sum15 = ${sum3 + sum5 - sum15}');
		var timeStamp2 = Timer.stamp();

		trace('Time taken: ${timeStamp2 - timeStamp1}\n');
	}

	/**
	 * Traces the whole solution onto the console
	 * @param multiple
	 */
	inline private function getSumOfMultiple(multiple) {
		trace('Using the arithmetic series formula');

		var seriesCount = Math.floor((upperLimit - 1) / multiple);
		var sum = (seriesCount / 2) * (2 * multiple + (seriesCount - 1) * multiple);
		// print sum to console
		trace('The sum of the series of multiple $multiple: $sum\n');

		// return sum of array
		return sum;
	}
}
