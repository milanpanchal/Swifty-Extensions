//
//  UIViewController+Extensions.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

extension UIViewController {
  
    // MARK: - Notifications
    public func addNotificationObserver(name: String, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }
    
    public func removeNotificationObserver(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }
    
    public func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    #if os(iOS)
    
    public func addKeyboardWillShowNotification() {
        self.addNotificationObserver(UIKeyboardWillShowNotification, selector: #selector(UIViewController.keyboardWillShowNotification(_:)))
    }
    
    public func addKeyboardDidShowNotification() {
        self.addNotificationObserver(UIKeyboardDidShowNotification, selector: #selector(UIViewController.keyboardDidShowNotification(_:)))
    }
    
    public func addKeyboardWillHideNotification() {
        self.addNotificationObserver(UIKeyboardWillHideNotification, selector: #selector(UIViewController.keyboardWillHideNotification(_:)))
    }
    
    public func addKeyboardDidHideNotification() {
        self.addNotificationObserver(UIKeyboardDidHideNotification, selector: #selector(UIViewController.keyboardDidHideNotification(_:)))
    }
    
    public func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(UIKeyboardWillShowNotification)
    }
    
    public func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(UIKeyboardDidShowNotification)
    }
    
    public func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(UIKeyboardWillHideNotification)
    }
    
    public func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(UIKeyboardDidHideNotification)
    }
    
    public func keyboardDidShowNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo, value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.CGRectValue()
            keyboardDidShowWithFrame(frame)
        }
    }
    
    public func keyboardWillShowNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo, value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.CGRectValue()
            keyboardWillShowWithFrame(frame)
        }
    }
    
    public func keyboardWillHideNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo, value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.CGRectValue()
            keyboardWillHideWithFrame(frame)
        }
    }
    
    public func keyboardDidHideNotification(notification: NSNotification) {
        if let nInfo = notification.userInfo, value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.CGRectValue()
            keyboardDidHideWithFrame(frame)
        }
    }
    
    public func keyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidHideWithFrame(frame: CGRect) {
        
    }
    
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    #endif
    
    public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - VC Container

    
    public var tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController, visibleViewController = me.visibleViewController {
                return visibleViewController.tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }
    
    public var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController, visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.frame.size.height
            }
            return 0
        }
    }
    
    public var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController, visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
    
    public var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
    
    // MARK: - VC Flow
    
    public func addAsChildViewController(vc: UIViewController, toView: UIView) {
        toView.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMoveToParentViewController(self)
    }
    
    func setBackgroundImage(named: String) {
        let image = UIImage(named: named)
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    @nonobjc func setBackgroundImage(image: UIImage) {
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
}

