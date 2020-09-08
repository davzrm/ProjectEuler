package src;

import lib.AbSolution;

/**
 * Brute force...?
 */
class Solution1 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		// 30 days = April, June, Sept, Nov
		// 31 days = Jan, March, May, July, Aug, Oct, Dec
		// 28/29 days = Feb
		var daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

		// 1 Jan 1900 is a Monday
		// therefore, first Sunday here is 7 Jan 1900
		var firstOfMonthSundayCount = 0;
		var date = 7;
		for (currentYear in 1900...2001) {
			for (currentMonth in 0...12) {
				var daysToSubtract = daysInMonth[currentMonth];
				// February
				// Leap year = century year ? /400 : /4
				if (currentMonth == 1) {
					var leapYear = currentYear % 100 == 0 ? currentYear % 400 == 0 : currentYear % 4 == 0;
					if (leapYear) {
						daysToSubtract += 1;
					}
				}

				while (date < daysToSubtract) {
					if (date == 1 && currentYear > 1900) {
						firstOfMonthSundayCount++;
					}
					// 1 week = 7 days to the next Sunday
					date += 7;
				}

				date -= daysToSubtract;
			}
		}
		trace('The number of Sundays that fall on the first of the month in the 20th century: $firstOfMonthSundayCount');
	}
}
