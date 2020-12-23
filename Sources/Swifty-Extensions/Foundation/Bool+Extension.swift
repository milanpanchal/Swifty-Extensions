//
//  Bool+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import Foundation

public extension Bool {

    /**
     Toggle boolean value.
     */

    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}
