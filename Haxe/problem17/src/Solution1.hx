package src;

import haxe.Json;
import sys.io.File;
import lib.AbSolution;

/**
 * Math
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// From one to nine:
		var sumSingles = 3 + 3 + 5 + 4 + 4 + 3 + 5 + 5 + 4;

		// From ten to nineteen:
		var tenToNineteen = 3 + 6 + 6 + 8 + 8 + 7 + 7 + 9 + 8 + 8;

		// From 20 to 99:
		// twenty = 6
		// thirty = 6
		// forty = 5
		// fifty = 5
		// sixty = 5
		// seventy = 7
		// eighty = 6
		// ninety = 6
		var twentyToNinetyNine = (5 * 10 + sumSingles) * 3 + (6 * 10 + sumSingles) * 4 + (7 * 10 + sumSingles);

		// From 100 to 999:
		// hundred = 7
		// and = 3
		var hundredTo999 = (sumSingles + (7 * 9)) + ((sumSingles + (7 + 3) * 9) * 99 + (sumSingles + tenToNineteen + twentyToNinetyNine) * 9);

		// 1000:
		var thousand = 8 + 3;

		var totalSum = sumSingles + tenToNineteen + twentyToNinetyNine + hundredTo999 + thousand;
		trace('The sum of all the letters from 1 to 1000: $totalSum');
	}
}
