//
//  Dictionary+Extension.swift
//  Swifty-Extension
//
//  Created by MilanPanchal on 13/01/21.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import Foundation

extension CaseIterable where Self: RawRepresentable {

    static var allValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}
