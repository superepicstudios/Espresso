//
//  PrettyRelativeDateStyle.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

// TODO: Localization

public struct PrettyRelativeDateStyle: FormatStyle {
    
    public typealias FormatInput = Date
    public typealias FormatOutput = String
    
    public func format(_ value: Date) -> String {
        
        var string = "???"
        let calendar = Calendar.current
        
        let spellOutNumberFormatter = NumberFormatter()
        spellOutNumberFormatter.numberStyle = .spellOut
        
        if value.isToday { string = "Today" }
        else if value.isYesterday { string = "Yesterday" }
        else if value.isTomorrow { string = "Tomorrow" }
        else if value.isThisWeek {
            
            let numberOfDays = calendar.dateComponents(
                [.day],
                from: .today,
                to: value
            ).day ?? 0
            
            let numberOfDaysString = spellOutNumberFormatter.string(
                for: numberOfDays
            )?.capitalized ?? "\(numberOfDays)"
            
            string = if numberOfDays == 1 {
                "\(numberOfDaysString) Day"
            } else {
                "\(numberOfDaysString) Days"
            }
        }
        else if value.isLastWeek { string = "Last Week" }
        else if value.isNextWeek { string = "Next Week" }
        else if value.isThisMonth {
            
            let numberOfWeeks = calendar.dateComponents(
                [.weekOfYear],
                from: .today,
                to: value.endOfWeek
            ).weekOfYear ?? 0
            
            let numberOfWeeksString = spellOutNumberFormatter.string(
                for: numberOfWeeks
            )?.capitalized ?? "\(numberOfWeeks)"
            
            string = if numberOfWeeks == 1 {
                "\(numberOfWeeksString) Week"
            } else {
                "\(numberOfWeeksString) Weeks"
            }
        }
        else if value.isLastMonth { string = "Last Month" }
        else if value.isNextMonth { string = "Next Month" }
        else if value.isThisYear {
            
            let numberOfMonths = calendar.dateComponents(
                [.month],
                from: .today,
                to: value.endOfMonth
            ).month ?? 0
            
            let numberOfMonthsString = spellOutNumberFormatter.string(
                for: numberOfMonths
            )?.capitalized ?? "\(numberOfMonths)"
            
            string = if numberOfMonths == 1 {
                "\(numberOfMonthsString) Month"
            } else {
                "\(numberOfMonthsString) Months"
            }
        }
        else if value.isLastYear { string = "Last Year" }
        else if value.isNextYear { string = "Next Year" }
        else if value < .today { string = "Past" }
        else if value > .today { string = "Future" }

        return string
    }
}

extension FormatStyle where Self == PrettyRelativeDateStyle {
    public static var prettyRelative: Self {
        PrettyRelativeDateStyle()
    }
}
