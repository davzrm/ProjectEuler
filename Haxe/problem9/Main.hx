import lib.AbSolution;
import src.*;

/**
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */
class Main {
	public static function main() {
		var solution1:AbSolution = new Solution1();
		solution1.getSolution();

		var solution2:AbSolution = new Solution2();
		solution2.getSolution();
	}
}
