//
//  Bundle+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var appName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    
    var versionNumber: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }
    
    var buildNumber: String {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "1"
    }
    
    var packageVersion: String {
        return "\(versionNumber).\(buildNumber)"
    }
    
    var bundleId: String {
        return bundleIdentifier!
    }
    
}
