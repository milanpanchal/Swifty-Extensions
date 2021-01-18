//
//  Array+Extension.swift
//  Swifty-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import Foundation

public extension Array {

    
    /**
     Random element from the array.
     
     :returns: Random element from the array.
     */

    func random() -> Element? {
        guard self.count > 0 else { return nil }
        
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}

extension Array where Iterator.Element: Comparable {

    /// Check is array is already sorted or not
    ///
    ///     [1, 5, 3].isSorted(<)
    ///     // prints false
    ///
    ///     [1, 5, 10].isSorted(<)
    ///     // prints true
    ///
    ///     [3.5, 2.1, -5.4].isSorted(>)
    ///     // prints true
    

    func isSorted(isOrderedBefore: (Iterator.Element, Iterator.Element) -> Bool) -> Bool  {
        for i in 1 ..< self.count {
            if isOrderedBefore(self[i], self[i-1]) {
                return false
            }
        }
        return true
    }
}

extension Array where Element == String {
    
    var csvLine: String {
        return self.joined(separator: ",")
    }

    var totalCharacterCount: Int {
        return reduce(0, { $0 + $1.count})
    }
    
    var wordCount: Int {
        return reduce(0, {$0 + $1.components(separatedBy: " ").count})
    }
    
    func wordCharacterCount() -> [Int] {
        var countArray:[Int] = [Int]()
        countArray =  map{$0.count}
        return countArray
    }
    
}


public extension Array where Element == [String] {
    var csv: String {
        return self.reduce(into: [String]()) { (accumulator: inout [String], element) in
            let element2 = element.csvLine
            accumulator.append(element2)
        }.joined(separator: "\n")
    }
}


public extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.firstIndex(of: object) {
            self.remove(at: index)
        }
    }
}

public extension Array where Element == Int {

//    [1, 4, 5, 6, 7, 12, 14, 18, 19, 20, 22, 24].mean // 12.66666666666667
    var mean: Double {
        let sum = self.reduce(0, { a, b in
            return a + b
        })
        
        let mean = Double(sum) / Double(self.count)
        return Double(mean)
    }
    
//    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].median // 5.5
//    [1, 2, 3, 4, 5, 6, 7, 8, 9].median // 5
    var median: Double {
        let sorted = self.sorted()
        let length = self.count
        
        if (length % 2 == 0) {
            return (Double(sorted[length / 2 - 1]) + Double(sorted[length / 2])) / 2.0
        }
        
        return Double(sorted[length / 2])
    }

}
