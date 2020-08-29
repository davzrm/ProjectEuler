import src.*;
import haxe.Int64;

using buddy.Should;

class TestMain extends buddy.SingleSuite {
	public function new() {
		describe("Main test", {
			var solution = new Solution1();

			var biggestFactor1 = solution.computeLargestPrimeFactor(100);
			var biggestFactor2 = solution.computeLargestPrimeFactor(1000);
			var biggestFactor3 = solution.computeLargestPrimeFactor(49);
			var biggestFactor4 = solution.computeLargestPrimeFactor(32767);

			it("Test the biggest prime factor for a given number", {
				biggestFactor1.should.be(5);
				biggestFactor1.should.beType(Int);

				biggestFactor2.should.be(5);
				biggestFactor2.should.beType(Int);

				biggestFactor3.should.be(7);
				biggestFactor3.should.beType(Int);

				biggestFactor4.should.be(151);
				biggestFactor4.should.beType(Int);
			});
		});
	}
}
