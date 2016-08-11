//
//  UITextView+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

extension UITextView {
    
    #if os(iOS)
    
    /**
     Automatically adds a toolbar with a done button to the top of the keyboard. Tapping the button will dismiss the keyboard.
     */
    public func addDoneButton(barStyle: UIBarStyle = .Default, title: String? = nil) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: title ?? "Done", style: .Done, target: self, action: #selector(resignFirstResponder))
        ]
        
        keyboardToolbar.barStyle = barStyle
        keyboardToolbar.sizeToFit()
        
        inputAccessoryView = keyboardToolbar
    }
    
    #endif
}
