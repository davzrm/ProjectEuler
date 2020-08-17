package src;

import haxe.Timer;

class Solution1 {
	public function new() {}

	public function getSolution() {
		var stamp1 = Timer.stamp();
		computeSolution();
		var stamp2 = Timer.stamp();
		trace('Time taken: ${stamp2 - stamp1}');
	}

	/**
	 * Starting from number 20,
	 * finds the first number
	 * that is evenly divisible
	 * by all numbers from 1 to 20
	 */
	private function computeSolution() {
		var dividend = 20;
		while (true) {
			for (divisor in 2...(20 + 1)) {
				trace(divisor);
				if (dividend % divisor != 0) {
					break;
				} else if (divisor == 20) {
					trace('The smallest number possible is $dividend');
					return dividend;
				}
			}
			trace('Current dividend: $dividend');
			dividend = dividend + 16;
		}
	};
}
