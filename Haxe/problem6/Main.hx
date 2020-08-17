import lib.AbSolution;
import haxe.rtti.CType.Abstractdef;
import src.*;

/**
 * Find the difference between
 * the sum of the squares of the first one hundred natural numbers and
 * the square of the sum.
 */
class Main {
	public static function main() {
		var solution1:AbSolution = new Solution1();
		solution1.getSolution();

		var solution2:AbSolution = new Solution2();
		solution2.getSolution();
	}
}
