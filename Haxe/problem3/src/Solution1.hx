package src;

import haxe.Int64;
import haxe.Timer;

class Solution1 {
	public function new() {}

	public function getSolution() {
		var stamp1 = Timer.stamp();
		var integerBig:Int64 = Int64.fromFloat(600851475143);
		var primeNumber = computeLargestPrimeFactor(integerBig);
		trace('Largest prime factor is $primeNumber');
		var stamp2 = Timer.stamp();
		trace('Time taken: ${stamp2 - stamp1}');
	}

	/**
	 * Retrieve the biggest factor of a given number
	 * @param number
	 */
	public function computeLargestPrimeFactor(number:Int64) {
		// Create a variable to hold the biggest prime factor known
		var primeNum = 0;

		// Test every number from 2 to the given number & determine the biggest prime factor
		var holder = 2;
		while (holder < number) {
			if (Int64.mod(number, holder) == 0 && isPrime(holder)) {
				primeNum = holder;
			}
			holder++;
		}

		// Return the biggest prime factor
		return primeNum;
	}

	private function isPrime(number:Int):Bool {
		// Test every number from 2 to the given number
		for (i in 2...number) {
			if (number % i == 0) {
				return false;
			}
		}

		// Return true if the number given is a prime number
		return true;
	}
}
