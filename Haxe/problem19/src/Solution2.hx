package src;

import lib.AbSolution;

enum abstract Month(Int) from Int to Int {
	inline var JAN = 1;
	inline var FEB = 2;
	inline var MAR = 3;
	inline var APR = 4;
	inline var MAY = 5;
	inline var JUN = 6;
	inline var JUL = 7;
	inline var AUG = 8;
	inline var SEP = 9;
	inline var OCT = 10;
	inline var NOV = 11;
	inline var DEC = 12;
	inline var WEEK = 7;

	inline function new(month) {
		this = month;
	}

	public inline function dayCount(year):Int {
		switch (this) {
			case JAN | MAR | MAY | JUL | AUG | OCT | DEC:
				return 31;
			case APR | JUN | SEP | NOV:
				return 30;
			case FEB:
				return isLeapYear(year) ? 29 : 28;
			case _:
				return 0;
		}
	}

	inline function isLeapYear(year) {
		if (year % 100 == 0) {
			return year % 400 == 0;
		} else {
			return year % 4 == 0;
		}
	}

	@:op(a <= b)
	public inline function lessOrEqual(b) {
		return this <= b;
	}
}

/**
 * Brute force
 * Clearer Version
 */
class Solution2 extends AbSolution {
	public function new() {
		super();
	}

	private override function computeSolution() {
		var firstOfMonthSundayCount = 0;
		var date = 7;
		for (currentYear in 1900...2001) {
			var currentMonth = Month.JAN;
			while (currentMonth <= 12) {
				var daysInMonth = currentMonth.dayCount(currentYear);
				while (date < daysInMonth) {
					if (date == 1 && currentYear > 1900) {
						firstOfMonthSundayCount++;
					}
					date += Month.WEEK;
				}
				date -= daysInMonth;
				currentMonth++;
			}
		}
		trace('The number of Sundays that fall on the first of the month in the 20th century: $firstOfMonthSundayCount');
	}
}
