//
//  UIView+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UIView {
     
    func rounded(radius: CGFloat?=nil) {
        self.layer.cornerRadius = radius ?? self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
    
    func removeAllSubView() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func applyShadow(color: UIColor = .black,
                     opacity: Float = 0.5,
                     x: CGFloat = 0,
                     y: CGFloat = 2,
                     blur: CGFloat = 4,
                     cornerRadius: CGFloat?=nil) {

        self.layer.shadowColor      = color.cgColor
        self.layer.shadowOpacity    = opacity
        self.layer.shadowOffset     = CGSize(width: x, height: y)
        self.layer.shadowRadius     = blur/2 // HALF of blur
        self.layer.masksToBounds    = false
        
        // Apply Radius
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }

    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

}