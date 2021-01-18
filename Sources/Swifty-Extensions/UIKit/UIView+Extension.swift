//
//  UIView+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

public extension UIView {
     
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

    /// Remove shadow from the view
    func removeShadow() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = 0
        self.layer.shadowColor   = UIColor.clear.cgColor
        self.layer.shadowOpacity = 0.0
        self.layer.shadowOffset  = CGSize(width: 0, height: 0)
        self.layer.shadowRadius  = 0.0
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

    /// Add Tap gesture to the view
    /// By default there will be single tap gesture
    func addTapGesture(tapCount: Int = 1, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapCount
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    /// Apply Gradient to UIView
    /// The location is calculated in a range from 0 and 1. All doubles inside are considered valid.    
    /// If locations  are nil, the locations are automatically divided in equal parts
    
    func applyGradient( colors: [UIColor], locations: [NSNumber]? ) {
        assert(colors.count >= 2, "Colors must be at least 2.")
        if locations != nil {
            assert(colors.count == locations?.count, "Locations must have the same size of color array.")
        }
        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        shake.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 8, y: center.y))
        shake.toValue   = NSValue(cgPoint: CGPoint(x: center.x + 8, y: center.y))

        layer.add(shake, forKey: "position")
    }
}
