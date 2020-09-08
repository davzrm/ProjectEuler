package src;

import lib.AbSolution;

enum abstract Month(Int) from Int to Int {
	inline var JAN = 0;
	inline var FEB = 1;
	inline var MAR = 2;
	inline var APR = 3;
	inline var MAY = 4;
	inline var JUN = 5;
	inline var JUL = 6;
	inline var AUG = 7;
	inline var SEP = 8;
	inline var OCT = 9;
	inline var NOV = 10;
	inline var DEC = 11;
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
			while (currentMonth <= Month.DEC) {
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
