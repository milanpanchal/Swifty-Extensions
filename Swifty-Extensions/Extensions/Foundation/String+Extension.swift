//
//  String+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import Foundation

public extension String {
    
    /// Capitalizes first character of String
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    /// Trims white space and new line characters, returns a new string
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// split string using a spearator string, returns an array of string
    func split(separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    /// split string with delimiters, returns an array of string
    func split(characters: CharacterSet) -> [String] {
        return self.components(separatedBy: characters)
    }
    
    /// Replacing target string with new string
    func replace(target: String, with newString: String) -> String {
        return self.replacingOccurrences(of: target, with: newString)
    }
    
    /// Returns count of words in string
    var numberOfWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, self.count)) ?? 0
    }
    
    
    /// Checks if String contains Email
    var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let firstMatch = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: self.count))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
    }
    
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-àáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßĀāĂăĄąĆćĈĉĊċČčĎďĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłŃńŅņŇňŉŊŋŌōŎŏŐőŒŔŕŖŗŘřŚśŜŝŞşŠšŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽž]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}" // swiftlint:disable:this line_length
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Check if string is valid password format.
    var isPasswordValid: Bool {
        let pwdRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        let pwdTest = NSPredicate(format: "SELF MATCHES %@", pwdRegEx)
        return pwdTest.evaluate(with: self)
    }
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
        return String(cleanedUpCopy.enumerated().map {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
        }.joined().dropFirst())
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: range.lowerBound)
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[idx1..<idx2])
    }
    
    func isContainNumber() -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase     = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
    
    func isContainLowercaseCharacter() -> Bool {
        let numberRegEx  = ".*[a-z]+.*"
        let testCase     = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
    
    func isContainUppercaseCharacter() -> Bool {
        let numberRegEx  = ".*[A-Z]+.*"
        let testCase     = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
    /// For UTC, TimeZone(abbreviation: "UTC")
    /// For Local Timezone, TimeZone.current
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone = .current) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
    
    /**
     Parses a string containing a boolean value (true or false) into an optional Bool if the string is a well formed.
     :returns: A Bool parsed from the string or nil if it cannot be parsed as a boolean.
     */
    func toBool() -> Bool? {
        let text = self.trimmed.lowercased()
        if text == "true" || text == "false" || text == "yes" || text == "no" {
            return (text as NSString).boolValue
        }
        
        return nil
    }
    
    /// Returns if String is a number
    func isNumber() -> Bool {
        return NumberFormatter().number(from: self) != nil
    }
    
    func reverseString() -> String {
        return String(self.reversed())
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 !.?"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func convertToDictionary() -> [String: Any]? {
        if let data = data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
        return nil
    }
    
    /// var str = "Hello, playground"
    /// let result = str.vowelConsonantCount()
    /// result.vowels // 5
    /// result.consonants // 10
    
    func vowelConsonantCount() -> (vowels: Int, consonants: Int) {
        var numOfVow = 0, numOfCon = 0
        
        self.lowercased().forEach { (char) in
            if "aeiou".contains(char) {
                numOfVow += 1
            } else if "bcdfghjklmnpqrstvwxyz".contains(char) {
                numOfCon += 1
            }
        }
        return (numOfVow, numOfCon)
    }
    
    /// var str = "Hello, playground"
    /// print(str.numberOfVowels) // 5
    var numberOfVowels: Int {
        var numOfVow = 0
        self.lowercased().forEach { (char) in
            if "aeiou".contains(char) {
                numOfVow += 1
            }
        }
        
        return numOfVow
    }
}

