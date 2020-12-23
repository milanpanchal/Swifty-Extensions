//
//  Locale+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

extension Locale {
    
    var regionName: String? {
        
        let locale = Locale.current
        if let countryCode = locale.regionCode {
            return locale.localizedString(forRegionCode: countryCode)
        }
        
        return nil
    }
    
    static func get2LetterLanguageCode() -> String {
        let languageSplitted = Locale.preferredLanguages[0].components(separatedBy: "-")
        if languageSplitted.count > 1 {
            return languageSplitted[0]
        } else {
            return "en"
        }
    }
}
