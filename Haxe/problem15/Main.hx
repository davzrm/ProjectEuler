import lib.AbSolution;
import src.*;

/**
 * Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
 * there are exactly 6 routes to the bottom right corner.
 * How many such routes are there through a 20×20 grid?
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
