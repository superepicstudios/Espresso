//
//  PrettyRelativeDateStyle.swift
//  Espresso
//
//  Created by Mitch Treece on 7/1/26.
//  Copyright © 2026 Super Epic Studios, LLC.
//

import Foundation

// TODO: Localization

// Today
// Tomorrow
// This Week
// Next Week

public struct PrettyRelativeDateStyle: FormatStyle {
    
    public typealias FormatInput = Date
    public typealias FormatOutput = String
    
    public func format(_ value: Date) -> String {
        
        var string = "???"
        let calendar = Calendar.current
        
        if value.isYesterday { string = "Yesterday" }
        else if value.isToday { string = "Today" }
        else if value.isTomorrow { string = "Tomorrow" }

        else if value.isLastWeek { string = "Last Week" }
        else if value.isThisWeek { string = "This Week" }
        else if value.isNextWeek { string = "Next Week" }
        
        else if value.isLastMonth { string = "Last Month" }
        else if value.isThisMonth {
            
            // "This Month"
            // 2 weeks
            // 3 weeks
            
            let weeks = calendar.dateComponents(
                [.weekOfYear],
                from: .today,
                to: value.endOfWeek
            ).weekOfYear ?? 0
            
            string = if weeks == 1 {
                "1 Week"
            } else {
                "\(weeks) Weeks"
            }
        }
        else if value.isNextMonth { string = "Next Month" }
        
        else if value.isLastYear { string = "Last Year" }
        else if value.isThisYear {
            
            // 2 Months
            // 3 Months
            // etc
            
            string = "This Year"
        }
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
