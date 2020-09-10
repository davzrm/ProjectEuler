package src;

import haxe.Json;
import sys.io.File;
import lib.AbSolution;

using StringTools;

/**
 * Brute force
 * With character codes instead.
 * The alphabet starts with the character code of 65
 * that is, A -> 65
 * &, Z -> 90
 *
 * Therefore, we only need to minus 64 to get the letter value.
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var namesPath = "p022_names.txt";
		var fileString = File.getContent(namesPath);
		var cleanedString = fileString.replace("\"", '');
		var stringArray = cleanedString.split(",");

		stringArray.sort((a, b) -> a > b ? 1 : -1);
		var sumValue = 0;
		for (i in 0...stringArray.length) {
			var nameValue = computeNameValue(stringArray[i]);
			nameValue *= (i + 1);
			sumValue += nameValue;
		}
		trace('The total name score: $sumValue');
	}

	public function computeNameValue(name:String) {
		var nameValue = 0;
		for (i in 0...name.length) {
			nameValue += name.fastCodeAt(i) - 64;
		}

		return nameValue;
	}
}
