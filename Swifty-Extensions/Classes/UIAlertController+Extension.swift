//
//  UIAlertController+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 04/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension UIAlertController {


    //TODO:
    public convenience init?(titleText: String, messageText: String) {

        self.init()
        
        let alertController = UIAlertController(title: messageText, message: messageText, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        alertController.show()
        alertController.view.tintColor = UIColor.redColor()

    }
    
    func show() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(self, animated: true, completion: nil)
    }

}
