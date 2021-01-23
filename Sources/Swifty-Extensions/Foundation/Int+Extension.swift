//
//  Int+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 13/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

public extension Int {
    
    private var double: Double { return Double(self) }
    
    var isPerfectSquare: Bool {
        return double.squareRoot().rounded() == double.squareRoot()
    }
    
    var minutesToHoursMinutes: String {
        if self == 0 { return "0 mins" }
        
        let hours = self / 60
        let minutes = self % 60
        
        if hours != 0, minutes != 0 {
            return "\(hours) hr\(hours == 1 ? "": "s") \(minutes) min\(minutes == 1 ? "": "s")"
        } else if hours != 0 {
            return "\(hours) hr\(hours == 1 ? "": "s")"
        } else {
            return "\(minutes) min\(minutes == 1 ? "": "s")"
        }
    }
}
