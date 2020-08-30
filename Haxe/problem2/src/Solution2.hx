package src;

import haxe.Int64;
import lib.AbSolution;

/**
 * It is possible to deal with only even numbers,
 * looking at the Fibonacci sequence, every 3rd number after 2 is an even number.
 *
 * This happens because the addition of 2 odd numbers will always give an even number.
 * And it so happens that we have 2 odd numbers before every even number,
 * since after the number 2 in the sequence,
 * those 2 odd numbers come from the addition
 * of the previous even number and the odd number before that even number
 * & of that even number and the odd number after it, respectively.
 *
 * Expressing it in formula...
 * The even number at the... Nth term = (N-1)th term + (N-2)th term
 * That means we have another even number at... (N-3)th term
 * Also, we know that... (N-1th)th term = (N-2)th term + (N-3)th term
 * &... (N-2)th term = (N-3)th term + (N-4)th term
 * &... so on until we get...
 *
 * Nth term = 4 * (N-3)th term + (N-6)th term
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	override function computeSolution() {
		// Initialize local variables
		var upperLimit = 4000000;
		var previousEven = 2;
		var previousEven2 = 0;
		var sumFiboEven = 0;

		// Set loop
		var index = previousEven;
		while (index < upperLimit) {
			sumFiboEven += index;

			index = 4 * previousEven + previousEven2;
			previousEven2 = previousEven;
			previousEven = index;
		}

		trace('The sum of all evens below 4M in a Fibonacci sequence is: $sumFiboEven');
	}
}
