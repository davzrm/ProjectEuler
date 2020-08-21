package src;

import lib.AbSolution;

/**
 * Using Euclid's formula
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// With 2 arbitrary positive integers, m & n.
		// Where m > n > 0.
		// Therefore the minimum values are as follows:
		var m = 2;
		var n = 1;

		// We can compute the BASE of the terms in a pythagorean triple (a^2 + b^2 = c^2)
		// with the following formula:
		var a = 2 * m * n;
		var b = m * m - n * n;
		var c = m * m + n * n;

		// In order to represent all possible pythagorean triples
		// We need to first make the triple primitive
		// Meaning reducing them to the point where all 3 terms are coprime (GCD(a,b,c) = 1)

		// For that to happen, we cannot have all 3 terms be even, else they be divided by 2.
		// We know A, from above, must be even since it multiplies 2.
		// If B was even, C will be even too, FAILING to make a primitive triple.
		// Therefore B must be odd, and C will then also be odd.

		// A perfect square of an odd number will be odd, likewise for even
		// Adding 2 odd numbers give an even number.
		// Therefore to make B and C odd,
		// either M or N can be odd, but not both.

		// Finally, we introduce another variable, k
		// to hold a common integer for each term
		// in order to create a general formula for all possible pythagorean triples (including not primitives):
		var k = 1;
		a = k * 2 * m * n;
		b = k * (m * m - n * n);
		c = k * (m * m + n * n);

		// Applying this to the problem,
		// We know that a + b + c = 1000
		// Expanding each variable gives:
		// [k * 2 * m * n] + [k * (m * m - n * n)] + [k * (m * m + n * n)] = 1000
		// 2 * k * m * (m + n) = 1000

		// Now, all we need to do is test for each value of M & N,
		// if (1000 /2) can be divided by both M & (M+N),
		// Then calculate k
		// & calculate a, b & c
		var sum = 1000;
		m = 2;
		n = 1;
		k = 1;
		var isFound = false;
		while (true) {
			var holderSum = sum / 2;
			if (holderSum % m != 0) {
				m++;
				continue;
			}

			holderSum = holderSum / m;
			for (n in 1...m) {
				var factor = m + n;
				// make sure only 1 odd
				if (factor % 2 == 0) {
					continue;
				}
				if (holderSum % factor == 0) {
					k = Std.int(holderSum / factor);
					isFound = true;
					break;
				}
			}
			if (isFound) {
				break;
			}
			m++;
		}

		a = k * 2 * m * n;
		b = k * (m * m - n * n);
		c = k * (m * m + n * n);
		trace('The pythagorean triple, A = $a, B = $b, C = $c');
	}
}
