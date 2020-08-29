package src;

import lib.AbSolution;
import haxe.Timer;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	override private function computeSolution() {
		var dividend = 20;
		var isFound = false;
		while (true) {
			for (divisor in 2...(20 + 1)) {
				if (dividend % divisor != 0) {
					break;
				} else if (divisor == 20) {
					isFound = true;
				}
			}

			if (isFound) {
				break;
			}

			dividend = dividend + 20;
		}
		trace('The smallest multiple is $dividend');
	};
}
