//
//  UIButton+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UIButton {

    open override var isEnabled: Bool {
        didSet {
            self.alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    func transformImageToRight(leftPadding: CGFloat = 0.0) {
        
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)

    }
}
