package src;

import haxe.Timer;

class Solution1 {
	public function new() {}

	public function getSolution() {
		var stamp1 = Timer.stamp();
		computeSolution(20);
		var stamp2 = Timer.stamp();
	}

	/**
	 * Starting from number 20,
	 * finds the first number
	 * that is evenly divisible
	 * by all numbers from 1 to 20
	 */
	private function computeSolution(number) {
		var dividend = 20;
		while (true) {
			for (divisor in 2...number + 1) {
				trace(divisor);
				if (dividend % divisor != 0) {
					break;
				} else if (divisor == number) {
					trace('The smallest number possible is $dividend');
					return dividend;
				}
			}
			trace('Current dividend: $dividend');
			dividend = dividend + 2;
		}
	};
}
