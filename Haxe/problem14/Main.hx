import lib.AbSolution;
import src.*;

/**
	* The following iterative sequence is defined for the set of positive integers:
	* n → n/2 (n is even)
	* n → 3n + 1 (n is odd)

	* Which starting number, under one million, produces the longest chain?
 */
class Main {
	public static function main() {
		var solution1:AbSolution = new Solution1(); // TEST AT YOUR OWN RISK
		solution1.getSolution();

		var solution2:AbSolution = new Solution2();
		solution2.getSolution();

		var solution3:AbSolution = new Solution3();
		solution3.getSolution();
	}
}
