//
//  Double+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import Foundation

public extension Double {
    
    func celsiusToFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    /**
     Random double between min and max (inclusive).
     
     :params: min
     :params: max
     :returns: Random number
     */
    static func random(min: Double = 0, max: Double) -> Double {
        let diff = max - min;
        let rand = Double(arc4random() % (UInt32(RAND_MAX) + 1))
        return ((rand / Double(RAND_MAX)) * diff) + min;
    }
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    var isPerfectSquare: Bool {
        return self.squareRoot().rounded() == self.squareRoot()
    }
    
    /// Usage:
    /// let dPrice = 16.50
    /// let strPrice = dPrice.toPrice(currency: "€")

    func toPrice(currency: String) -> String {
        let nf = NumberFormatter()
        nf.decimalSeparator = ","
        nf.groupingSeparator = "."
        nf.groupingSize = 3
        nf.usesGroupingSeparator = true
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return (nf.string(from: NSNumber(value: self)) ?? "?") + currency
    }
}

