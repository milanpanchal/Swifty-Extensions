//
//  UIImageView+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension UIImageView {
    
    //height and width should be the same
    
    func roundImage() {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
}
