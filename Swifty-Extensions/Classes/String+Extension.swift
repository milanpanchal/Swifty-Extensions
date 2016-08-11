//
//  String+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension String {

    /// Character count
    public var length: Int {
        return self.characters.count
    }
    
    /// Capitalizes first character of String
    public var capitalizeFirst: String {
        var result = self
        result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
        return result
    }
    
    /// Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    /// split string using a spearator string, returns an array of string
    public func split(separator: String) -> [String] {
        return self.componentsSeparatedByString(separator).filter {
            !$0.trimmed().isEmpty
        }
    }
    
    /// split string with delimiters, returns an array of string
    public func split(characters: NSCharacterSet) -> [String] {
        return self.componentsSeparatedByCharactersInSet(characters).filter {
            !$0.trimmed().isEmpty
        }
    }
    
    func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString)
    }
    

    /// Returns count of words in string
    public var numberOfWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpressionOptions())
        return regex?.numberOfMatchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, self.length)) ?? 0
    }

    
    /// Checks if String contains Email
    public var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        let firstMatch = dataDetector?.firstMatchInString(self, options: NSMatchingOptions.ReportCompletion, range: NSRange(location: 0, length: length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.URL?.scheme == "mailto")
    }

    
    /**
     Parses a string containing a double numerical value into an optional double if the string is a well formed number.
     :returns: A double parsed from the string or nil if it cannot be parsed.
     */
    func toDouble() -> Double? {
        
        let scanner = NSScanner(string: self)
        var double: Double = 0
        
        if scanner.scanDouble(&double) {
            return double
        }
        
        return nil
        
    }
    
    /**
     Parses a string containing a float numerical value into an optional float if the string is a well formed number.
     :returns: A float parsed from the string or nil if it cannot be parsed.
     */
    func toFloat() -> Float? {
        
        let scanner = NSScanner(string: self)
        var float: Float = 0
        
        if scanner.scanFloat(&float) {
            return float
        }
        
        return nil
        
    }
    
    /**
     Parses a string containing a non-negative integer value into an optional UInt if the string is a well formed number.
     :returns: A UInt parsed from the string or nil if it cannot be parsed.
     */
    func toUInt() -> UInt? {
        if let val = self.trimmed().toInt() {
            if val < 0 {
                return nil
            }
            return UInt(val)
        }
        
        return nil
    }
    
    
    /**
     Parses a string containing a boolean value (true or false) into an optional Bool if the string is a well formed.
     :returns: A Bool parsed from the string or nil if it cannot be parsed as a boolean.
     */
    func toBool() -> Bool? {
        let text = self.trimmed().lowercaseString
        if text == "true" || text == "false" || text == "yes" || text == "no" {
            return (text as NSString).boolValue
        }
        
        return nil
    }


    /// Converts String to Int
    public func toInt() -> Int? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.integerValue
        } else {
            return nil
        }
    }

    /// Returns if String is a number
    public func isNumber() -> Bool {
        if let _ = NSNumberFormatter().numberFromString(self) {
            return true
        }
        return false
    }

    ///Returns hight of rendered string
    func height(width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle();
            paragraphStyle.lineBreakMode = lineBreakMode!;
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName);
        }
        let size = CGSize(width: width, height: CGFloat(DBL_MAX));
        return ceil((self as NSString).boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }

    //TODO: Needs to implement
    /*public func isStartsWithACapitalLetter() -> Bool {
    
        
    }*/
    
    public func reverseString() -> String? {
        return String(self.characters.reverse())
    }
}

