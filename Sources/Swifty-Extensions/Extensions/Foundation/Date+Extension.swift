//
//  Date+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

public extension Date {

    /// Initializes Date from string and format
    init?(fromString string: String, format: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self.init(timeInterval: 0, since: date)
        } else {
            self.init()
            return nil
        }
    }
    
    /// Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
    func timeAgoSinceDate() -> String {

        // From Time
        let fromDate = self

        // To Time
        let toDate = Date()

        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0 {

            return interval == 1 ? "\(interval) year ago" : "\(interval) years ago"
        }

        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0 {

            return interval == 1 ? "\(interval) month ago" : "\(interval) months ago"
        }

        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0 {

            return interval == 1 ? "\(interval) day ago" : "\(interval) days ago"
        }

        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {

            return interval == 1 ? "\(interval) hour ago" : "\(interval) hours ago"
        }

        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {

            return interval == 1 ? "\(interval) minute ago" : "\(interval) minutes ago"
        }
        
        // Second
        if let interval = Calendar.current.dateComponents([.second], from: fromDate, to: toDate).second, interval > 1 {

            return "\(interval) seconds ago"
        }


        return "Just now"
    }
    
    /// Converts Date to String, with format and timezone

    func toString(withFormat format: String = "MMM dd, yyyy", timeZone: TimeZone = .current ) -> String {

        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /// Converts Date to String
    func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
         formatter.dateStyle = dateStyle
         formatter.timeStyle = timeStyle
        return formatter.string(from: self)
     }
    
    /// Calculates how many seconds passed from now to date
    func secondsInBetweenDate(date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
    
    static var currentTimeStamp: Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}

/// Returns if dates are equal to each other
public func == (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedSame
}

/// Returns if one date is less than the other
public func < (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}

/// Returns if one date is grater than the other
public func > (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedDescending
}
