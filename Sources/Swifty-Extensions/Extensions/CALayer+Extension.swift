//
//  CALayer+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 14/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    /// Apply all 6 sketch shadow properties to the View
    func applySketchShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat = 0) {
        
        shadowColor   = color.cgColor
        shadowOpacity = alpha
        shadowOffset  = CGSize(width: x, height: y)
        shadowRadius  = blur / UIScreen.main.scale
        masksToBounds = false
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx     = -spread
            let rect   = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
