//
//  String+Extension.swift
//  Swifty-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit
import CoreLocation

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
    
    mutating func trim() {
        self = self.trimmed
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
    
    /// Usage
    /// let digitsOnlyYes = "1234567890".containsOnlyDigits
    /// let digitsOnlyNo = "12345+789".containsOnlyDigits

    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    /// Usage
    // let alphanumericYes = "asd3kJh43saf".isAlphanumeric
    // let alphanumericNo = "Kkncs+_s3mM.".isAlphanumeric

    var isAlphanumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
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
    
    /// Generate a random alphanumeric string of 'x' length. Default lenght is 20
    func randomString(length: Int = 20) -> String {
        guard length > 0 else {
            return ""
        }
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 !.?"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    /// Usage:
    /// let json = "{\"hello\": \"world\"}"
    /// let dictFromJson = json.asDict

    var asDict: [String: Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
    
    /// Converts the JSON array into a Swift array
    /// Usage:
    /// let json = "[1, 2, 3]"
    /// let dictFromJson = json.asArray

    var asArray: [Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
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

    /// Usage:
    /// let strCoordinates = "41.6168, 41.6367"
    /// let coordinates = strCoordinates.asCoordinates

    var asCoordinates: CLLocationCoordinate2D? {
        let components = self.components(separatedBy: ",")
        if components.count != 2 { return nil }
        let strLat = components[0].trimmed
        let strLng = components[1].trimmed
        if let dLat = Double(strLat),
            let dLng = Double(strLng) {
            return CLLocationCoordinate2D(latitude: dLat, longitude: dLng)
        }
        return nil
    }
    
    ///UIKit’s labels do a great job of truncating strings to a specific length, but for other purposes – such as writing out to a file, rendering to an image, or showing messages – we need to roll something ourselves.
    ///
    ///     let testString = "He thrusts his fists against the posts and still insists he sees the ghosts."
    ///     print(testString.truncate(to: 20, addEllipsis: true))

    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }

        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]

        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }
}

public extension String {
    
    /// Usage:
    /// let text = "Hello, world!"
    /// let textHeight = text.height(withConstrainedWidth: 100, font: UIFont.systemFont(ofSize: 16))
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
