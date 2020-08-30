import lib.AbSolution;
import src.*;

/**
 * By considering the terms in the Fibonacci sequence whose values
 * do not exceed four million,
 * find the sum of the even-valued terms.
 */
class Main {
	public static function main() {
		var solution1:AbSolution = new Solution1();
		solution1.getSolution();

		var solution2:AbSolution = new Solution2();
		solution2.getSolution();
	}
}
