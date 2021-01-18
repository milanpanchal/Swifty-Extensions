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
    
    // Usage: Date.randomDate(range: 500) // Any date that is +/- 500 days from the current date
    static func randomDate(range: Int) -> Date {
        // Get the interval for the current date
        let interval =  Date().timeIntervalSince1970
        
        // There are 86,400 milliseconds in a day (ignoring leap dates)
        // Multiply the 86,400 milliseconds against the valid range of days
        let intervalRange = Double(86_400 * range)
        
        // Select a random point within the interval range
        let random = Double(arc4random_uniform(UInt32(intervalRange)) + 1)
        
        // Since this can either be in the past or future, we shift the range
        // so that the halfway point is the present
        let newInterval = interval + (random - (intervalRange / 2.0))
        
        // Initialize a date value with our newly created interval
        return Date(timeIntervalSince1970: newInterval)
    }
    
     func startOfMonth() -> Date {
         var components = Calendar.current.dateComponents([.year,.month], from: self)
         components.day = 1
         let firstDateOfMonth: Date = Calendar.current.date(from: components)!
         return firstDateOfMonth
     }
     
     func endOfMonth() -> Date {
         return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
     }
     
     func nextDate() -> Date {
         let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: self)
         return nextDate ?? Date()
     }
     
     func previousDate() -> Date {
         let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
         return previousDate ?? Date()
     }
     
     func addMonths(numberOfMonths: Int) -> Date {
         let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
         return endDate ?? Date()
     }
     
     func removeMonths(numberOfMonths: Int) -> Date {
         let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
         return endDate ?? Date()
     }
     
     func removeYears(numberOfYears: Int) -> Date {
         let endDate = Calendar.current.date(byAdding: .year, value: -numberOfYears, to: self)
         return endDate ?? Date()
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
