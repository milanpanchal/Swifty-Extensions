//
//  Bool+Extensions.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension Bool {

    /**
     Toggle boolean value.
     
     */

    public mutating func toggle() -> Bool {
        self = !self
        return self
    }

}
