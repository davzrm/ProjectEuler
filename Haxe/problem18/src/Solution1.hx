package src;

import sys.io.File;
import lib.AbSolution;

typedef Node = {
	value:Int,
	left:Null<Node>,
	right:Null<Node>
}

/**
 * Brute force
 */
class Solution1 extends AbSolution {
	var biggestSum = 0;

	public function new() {
		super();
	}

	private override function computeSolution() {
		var tree = setTree();

		countTree(tree[0], 0);
		trace('The maximum total: $biggestSum');
	}

	public function setTree() {
		var path = 'source.txt';
		var triangleString = File.getContent(path);

		var regex = ~/\s+/g;
		var triangleArray = regex.split(triangleString);

		var tree:Array<Node> = [
			for (i in triangleArray)
				{
					value: Std.parseInt(i),
					left: null,
					right: null
				}
		];

		// Set children for each node
		var tier = 1;
		var currentIndex = 0;
		var isFinished = false;
		while (!isFinished) {
			for (index in currentIndex...currentIndex + tier) {
				if (tree[index] == null) {
					isFinished = true;
					break;
				}
				var leftChildIndex = tier + index;
				var rightChildIndex = tier + index + 1;
				tree[index].left = tree[leftChildIndex];
				tree[index].right = tree[rightChildIndex];
			}
			currentIndex += tier;
			tier++;
		}

		return tree;
	}

	private function countTree(node:Node, sum) {
		// start from root
		// visit interior number
		var currentNode = node;
		var currentSum = sum + currentNode.value;

		// check left
		// check right
		if (node.left != null) {
			countTree(currentNode.left, currentSum);
			countTree(currentNode.right, currentSum);
		}

		// compare with total sum
		else if (currentSum > biggestSum) {
			biggestSum = currentSum;
		}
	}
}
