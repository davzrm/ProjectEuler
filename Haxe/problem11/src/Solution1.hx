package src;

import sys.io.File;
import lib.AbSolution;

using StringTools;

class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var arrayGrid = createGrid();
		var greatestNumber = 0;
		var adjacentCount = 4;
		var limitIncluded = 20 - adjacentCount;

		// Scan through the grid 4 times, with 4 directions:
		// 1) left to right
		for (row in arrayGrid) {
			// constrain the index to be less than row length
			var index = 0;
			while (index <= limitIncluded) {
				// position the pointer at the correct columm
				// ensure pointer doesn't run ahead of 4 adjacent numbers
				var pointer = index;
				var multiple = 1;
				while (pointer < index + adjacentCount) {
					multiple *= row[pointer];
					pointer++;
				}
				if (greatestNumber < multiple) {
					greatestNumber = multiple;
				}
				index++;
			}
		}

		// 2) top to bottom
		var columnIndex = 0;
		while (columnIndex < arrayGrid.length) {
			// same as above
			// except this time row & column swapped
			var rowIndex = 0;
			while (rowIndex <= limitIncluded) {
				var rowPointer = rowIndex;
				var multiple = 1;
				while (rowPointer < rowIndex + adjacentCount) {
					multiple *= arrayGrid[rowPointer][columnIndex];
					rowPointer++;
				}
				if (greatestNumber < multiple) {
					greatestNumber = multiple;
				}
				rowIndex++;
			}
			columnIndex++;
		}

		// 3) diagonal right-down
		// ensure the rowPointer doesn't run ahead for 4 numbers downwards
		var rowIndex = 0;
		while (rowIndex <= limitIncluded) {
			// ensure the columnPointer doesn't run ahead for 4 numbers to the right
			var columnIndex = 0;
			while (columnIndex <= limitIncluded) {
				// create 2 pointers for the row & column, set the to their corresponding index
				// increment each by +1 after each multiplication
				var rowPointer = rowIndex;
				var columnPointer = columnIndex;
				var multiple = 1;
				while (rowPointer < rowIndex + adjacentCount) {
					multiple *= arrayGrid[rowPointer][columnPointer];
					rowPointer++;
					columnPointer++;
				}
				if (greatestNumber < multiple) {
					greatestNumber = multiple;
				}
				columnIndex++;
			}
			rowIndex++;
		}

		// 4) diagonal left-down
		// Same as right-down, only in reverse, starting from right
		var rowIndex = 0;
		var limitFromRight = 0 + adjacentCount - 1;
		while (rowIndex <= limitIncluded) {
			// ensure the columnPointer doesn't run ahead for 4 numbers to the left
			var columnIndex = 20 - 1;
			while (columnIndex >= limitFromRight) {
				// the rowPointer still starts from Top
				// the columnPointer starts from Right this time
				var rowPointer = rowIndex;
				var columnPointer = columnIndex;
				var multiple = 1;
				while (rowPointer < rowIndex + adjacentCount) {
					multiple *= arrayGrid[rowPointer][columnPointer];
					rowPointer++;
					columnPointer--;
				}
				if (greatestNumber < multiple) {
					greatestNumber = multiple;
				}
				columnIndex--;
			}
			rowIndex++;
		}
		trace('The greatest product of 4 adjacent number is: $greatestNumber');
	}

	/**
	 * Create the 20 x 20 grid
	 */
	private function createGrid():Array<Array<Int>> {
		var string = File.getContent('source.txt');
		var spaceRegex = ~/\s+/g;
		var arrayString = spaceRegex.split(string);
		var arrayGrid = [
			for (row in 0...20) [
				for (column in 0...20)
					Std.parseInt(arrayString[row * 20 + column])
			]
		];

		return arrayGrid;
	}
}
