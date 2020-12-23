//
//  Array+Extension.swift
//  Swift-Extension
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
