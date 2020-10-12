//
//  UINavigationController+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 13/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    ///Get previous view controller of the navigation stack
    var previousViewController: UIViewController? {
        
        if self.viewControllers.count >= 2 {
            return self.viewControllers[self.viewControllers.count - 2]
        }
        return nil
    }
    
}
