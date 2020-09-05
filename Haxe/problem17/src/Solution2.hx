package src;

import haxe.Json;
import sys.io.File;
import lib.AbSolution;

typedef LetterCountMap = {
	singles:Array<Int>,
	tens:Array<Int>,
	tensWithOne:Array<Int>,
	hundreds:Int,
	thousands:Int,
}

/**
 * Using haxe switches
 */
class Solution2 extends AbSolution {
	var letterNumberDictionary:LetterCountMap;

	public function new() {
		super();
		this.letterNumberDictionary = Json.parse(getLetterCountMap());
	}

	private override function computeSolution() {
		var totalSum = 0;
		for (i in 1...1000 + 1) {
			totalSum += regexConvert(i);
		}

		trace('The sum of all the letters from 1 to 1000: $totalSum');
	}

	public function regexConvert(number):Int {
		var sumLetters = 0;

		var numString = Std.string(number);
		var array = numString.split('');
		switch (array) {
			case ['1', '0', '0', '0']:
				sumLetters += letterNumberDictionary.singles[1];
				sumLetters += letterNumberDictionary.thousands;

			case [hundreds, tens, singles]:
				var indexHundreds = Std.parseInt(hundreds);
				sumLetters = letterNumberDictionary.singles[indexHundreds] + letterNumberDictionary.hundreds;

				if (tens != '0' || singles != '0') {
					// for the "AND" between hundred and ten
					sumLetters += 3;
					sumLetters += countTensPlaces(tens, singles);
				}

			case [x, y]:
				sumLetters += countTensPlaces(x, y);

			case [x]:
				var number = Std.parseInt(x);
				sumLetters += letterNumberDictionary.singles[number];

			case _:
		}

		return sumLetters;
	}

	inline private function countTensPlaces(tens, singles) {
		var indexTens = Std.parseInt(tens);
		var indexSingles = Std.parseInt(singles);

		if (indexSingles == 0) {
			return letterNumberDictionary.tens[indexTens];
		} else if (indexTens == 1) {
			return letterNumberDictionary.tensWithOne[indexSingles];
		} else {
			return letterNumberDictionary.tens[indexTens] + letterNumberDictionary.singles[indexSingles];
		}
	}

	private function getLetterCountMap() {
		var file = 'letterCount.json';
		var pika = File.getContent(file);
		return pika;
	}
}
