import lib.AbSolution;
import haxe.rtti.CType.Abstractdef;
import src.*;

/**
 * Find the thirteen adjacent digits in the 1000-digit number
 * that have the greatest product.
 * What is the value of this product?
 */
class Main {
	public static function main() {
		var solution1:AbSolution = new Solution1();
		solution1.getSolution();

		var solution2:AbSolution = new Solution2();
		solution2.getSolution();
	}
}
