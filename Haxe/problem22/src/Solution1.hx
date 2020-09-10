package src;

import haxe.Json;
import sys.io.File;
import lib.AbSolution;

using StringTools;

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	var valueMap:Map<String, Int>;

	public function new() {
		super();
		var letterValuePath = "letterValue.json";
		var valueString = File.getContent(letterValuePath);
		var res = Json.parse(valueString);

		valueMap = [
			for (i in Reflect.fields(res))
				Std.string(i) => Reflect.field(res, i)

		];
	}

	private override function computeSolution() {
		var namesPath = "p022_names.txt";
		var fileString = File.getContent(namesPath);
		var cleanedString = fileString.replace("\"", '');
		var stringArray = cleanedString.split(",");

		stringArray.sort((a, b) -> a > b ? 1 : -1);
		trace(stringArray.length);
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
		var nameArray = name.split('');
		for (letter in nameArray) {
			nameValue += valueMap[letter];
		}

		return nameValue;
	}
}
