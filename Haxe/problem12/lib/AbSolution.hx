package lib;

import haxe.Timer;

class AbSolution {
	private function new() {}

	public function getSolution() {
		var stamp1 = Timer.stamp();
		computeSolution();
		var stamp2 = Timer.stamp();
		trace('Time taken: ${stamp2 - stamp1}');
	}

	private function computeSolution() {};
}
