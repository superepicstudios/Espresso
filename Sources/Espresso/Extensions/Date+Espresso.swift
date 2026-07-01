//
//  Date+Espresso.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

// MARK: Building

extension Date {
    
    // Seconds
    
    /// Gets a date by setting this date's `seconds` value.
    /// - parameter seconds: A `seconds` value.
    /// - returns: A date with a given amount of `seconds`.
    public func withSeconds(_ seconds: Int) -> Date {
        Calendar.current.date(
            bySetting: .second,
            value: seconds,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `seconds` to this date.
    /// - parameter seconds: An amount of `seconds` to add.
    /// - returns: A date by adding a given amount of `seconds`.
    public func addingSeconds(_ seconds: Int) -> Date {
        Calendar.current.date(
            byAdding: .second,
            value: seconds,
            to: self
        )!
    }
    
    // Minutes
    
    /// Gets a date by setting this date's `minutes` value.
    /// - parameter minutes: A `minutes` value.
    /// - returns: A date with a given amount of `minutes`.
    public func withMinutes(_ minutes: Int) -> Date {
        Calendar.current.date(
            bySetting: .minute,
            value: minutes,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `minutes` to this date.
    /// - parameter minutes: An amount of `minutes` to add.
    /// - returns: A date by adding a given amount of `minutes`.
    public func addingMinutes(_ minutes: Int) -> Date {
        Calendar.current.date(
            byAdding: .minute,
            value: minutes,
            to: self
        )!
    }
    
    // Hours
    
    /// Gets a date by setting this date's `hours` value.
    /// - parameter hours: An `hours` value.
    /// - returns: A date with a given amount of `hours`.
    public func withHours(_ hours: Int) -> Date {
        Calendar.current.date(
            bySetting: .hour,
            value: hours,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `hours` to this date.
    /// - parameter hours: An amount of `hours` to add.
    /// - returns: A date by adding a given amount of `hours`.
    public func addingHours(_ hours: Int) -> Date {
        Calendar.current.date(
            byAdding: .hour,
            value: hours,
            to: self
        )!
    }
    
    // Days
    
    /// Gets a date by setting this date's `days` value.
    /// - parameter days: A `days` value.
    /// - returns: A date with a given amount of `days`.
    public func withDays(_ days: Int) -> Date {
        Calendar.current.date(
            bySetting: .day,
            value: days,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `days` to this date.
    /// - parameter days: An amount of `days` to add.
    /// - returns: A date by adding a given amount of `days`.
    public func addingDays(_ days: Int) -> Date {
        Calendar.current.date(
            byAdding: .day,
            value: days,
            to: self
        )!
    }
    
    // Weeks
    
    /// Gets a date by setting this date's `weeks` value.
    /// - parameter weeks: A `weeks` value.
    /// - returns: A date with a given amount of `weeks`.
    public func withWeeks(_ weeks: Int) -> Date {
        Calendar.current.date(
            bySetting: .weekOfYear,
            value: weeks,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `weeks` to this date.
    /// - parameter weeks: An amount of `weeks` to add.
    /// - returns: A date by adding a given amount of `weeks`.
    public func addingWeeks(_ weeks: Int) -> Date {
        Calendar.current.date(
            byAdding: .weekOfYear,
            value: weeks,
            to: self
        )!
    }
    
    // Months
    
    /// Gets a date by setting this date's `months` value.
    /// - parameter months: A `months` value.
    /// - returns: A date with a given amount of `months`.
    public func withMonths(_ months: Int) -> Date {
        Calendar.current.date(
            bySetting: .month,
            value: months,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `months` to this date.
    /// - parameter months: An amount of `months` to add.
    /// - returns: A date by adding a given amount of `months`.
    public func addingMonths(_ months: Int) -> Date {
        Calendar.current.date(
            byAdding: .month,
            value: months,
            to: self
        )!
    }
    
    // Years
    
    /// Gets a date by setting this date's `years` value.
    /// - parameter years: A `years` value.
    /// - returns: A date with a given amount of `years`.
    public func withYears(_ years: Int) -> Date {
        Calendar.current.date(
            bySetting: .year,
            value: years,
            of: self
        )!
    }
    
    /// Gets a date by adding an amount of `years` to this date.
    /// - parameter years: An amount of `years` to add.
    /// - returns: A date by adding a given amount of `years`.
    public func addingYears(_ years: Int) -> Date {
        Calendar.current.date(
            byAdding: .year,
            value: years,
            to: self
        )!
    }
}

// MARK: Day Helpers

extension Date {
    
    /// The start (0:00:00) of this date.
    public var startOfDay: Self {
        Calendar.current.startOfDay(for: self)
    }

    /// The middle (12:00:00) of this date.
    public var middleOfDay: Self {
        withHours(12).withMinutes(0).withSeconds(0)
    }

    /// The end (23:59:59) of this date.
    public var endOfDay: Self {
        withHours(23).withMinutes(59).withSeconds(59)
    }
    
    /// The start of this date's previous day.
    public var previousDay: Self {
        self.startOfDay.addingDays(-1)
    }
    
    /// The start of this date's next day.
    public var nextDay: Self {
        self.startOfDay.addingDays(1)
    }
}

// MARK: Week Helpers

extension Date {
    
    /// The start of this date's week.
    public var startOfWeek: Self {
        Calendar.current.dateComponents(
            [.calendar, .yearForWeekOfYear, .weekOfYear],
            from: self
        ).date!
    }
    
    /// The end of this date's week.
    public var endOfWeek: Self {
        self.startOfWeek.addingWeeks(1).addingSeconds(-1)
    }
    
    /// The start of this date's previous week.
    public var previousWeek: Self {
        self.startOfWeek.addingWeeks(-1)
    }
    
    /// The start of this date's next week.
    public var nextWeek: Self {
        self.startOfWeek.addingWeeks(1)
    }
}

// MARK: Month Helpers

extension Date {
    
    /// The start of this date's month.
    public var startOfMonth: Self {
        Calendar.current.dateComponents(
            [.calendar, .year, .month],
            from: self
        ).date!
    }
    
    /// The end of this date's month.
    public var endOfMonth: Self {
        self.startOfMonth.addingMonths(1).addingSeconds(-1)
    }
    
    /// The start of this date's previous month.
    public var previousMonth: Self {
        self.startOfMonth.addingMonths(-1)
    }
    
    /// The start of this date's next month.
    public var nextMonth: Self {
        self.startOfMonth.addingMonths(1)
    }
}

// MARK: Year Helpers

extension Date {
    
    /// The start of this date's year.
    public var startOfYear: Self {
        Calendar.current.dateInterval(
            of: .year,
            for: .today
        )!.start
    }
    
    /// The end of this date's year.
    public var endOfYear: Self {
        self.startOfYear.addingYears(1).addingSeconds(-1)
    }
    
    /// The start of this date's previous year.
    public var previousYear: Self {
        self.startOfYear.addingYears(-1)
    }
    
    /// The start of this date's next year.
    public var nextYear: Self {
        self.startOfYear.addingYears(1)
    }
}

// MARK: Relative Helpers

extension Date {
    
    // Days
    
    /// A date representing the start of today.
    public static var today: Self {
        Date().startOfDay
    }
    
    /// Flag representing if the date is within today.
    public var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    /// A date representing the start of yesterday.
    public static var yesterday: Self {
        Self.today.previousDay
    }
    
    /// Flag representing if the date is within yesterday.
    public var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }
    
    /// A date representing the start of tomorrow.
    public static var tomorrow: Self {
        Self.today.nextDay
    }
    
    /// Flag representing if the date is within tomorrow.
    public var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    // Weeks
    
    /// A date representing the start of this week.
    public static var thisWeek: Self {
        Self.today.startOfWeek
    }
    
    /// Flag representing if the date is within this week.
    public var isThisWeek: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .thisWeek,
            toGranularity: .weekOfYear
        )
    }
    
    /// A date representing the start of last week.
    public static var lastWeek: Self {
        Self.today.previousWeek
    }
    
    /// Flag representing if the date is within last week.
    public var isLastWeek: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .lastWeek,
            toGranularity: .weekOfYear
        )
    }
    
    /// A date representing the start of next week.
    public static var nextWeek: Self {
        Self.today.nextWeek
    }
    
    /// Flag representing if the date is within next week.
    public var isNextWeek: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .nextWeek,
            toGranularity: .weekOfYear
        )
    }
    
    // Months
    
    /// A date representing the start of this month.
    public static var thisMonth: Self {
        Self.today.startOfMonth
    }
    
    /// Flag representing if the date is within this month.
    public var isThisMonth: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .thisMonth,
            toGranularity: .month
        )
    }
    
    /// A date representing the start of last month.
    public static var lastMonth: Self {
        Self.today.previousMonth
    }
    
    /// Flag representing if the date is within last month.
    public var isLastMonth: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .lastMonth,
            toGranularity: .month
        )
    }
    
    /// A date representing the start of next month.
    public static var nextMonth: Self {
        Self.today.nextMonth
    }
    
    /// Flag representing if the date is within next month.
    public var isNextMonth: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .nextMonth,
            toGranularity: .month
        )
    }
    
    // Years
    
    /// A date representing the start of this year.
    public static var thisYear: Self {
        Self.today.startOfYear
    }
    
    /// Flag representing if the date is within this year.
    public var isThisYear: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .thisYear,
            toGranularity: .year
        )
    }
    
    /// A date representing the start of last year.
    public static var lastYear: Self {
        Self.today.previousYear
    }
    
    /// Flag representing if the date is within last year.
    public var isLastYear: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .lastYear,
            toGranularity: .year
        )
    }
    
    /// A date representing the start of next year.
    public static var nextYear: Self {
        Self.today.nextYear
    }
    
    /// Flag representing if the date is within next year.
    public var isNextYear: Bool {
        Calendar.current.isDate(
            self,
            equalTo: .nextYear,
            toGranularity: .year
        )
    }
}
