//
//  UIAlertController+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    class func showAlert(title: String?, message: String?, viewController: UIViewController?=nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if viewController != nil {
            viewController!.present(alertController, animated: true, completion: nil)
            
        } else {
            topMostViewController().present(alertController, animated: true, completion: nil)
        }
        
    }
    
    class func showError(errorMessage: String = "Oops! Something went wrong, please try again later") {
        UIAlertController.showAlert(title: "Error", message: errorMessage)
    }
    
    class func showSettingsAlert(title: String, message: String, viewController: UIViewController?=nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)! as URL, options: [:], completionHandler: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        topMostViewController().present(alertController, animated: true, completion: nil)
        
    }
        
}

public extension UIAlertController {
    /// Display message in prompt view
    ///
    /// — Parameters:
    /// — title: Title to display Alert
    /// — message: Pass string of content message
    /// — options: Pass multiple UIAlertAction title like “OK”,”Cancel” etc
    /// — completion: The block to execute after the presentation finishes.
    class func presentAlert(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            let style: UIAlertAction.Style = (option == "Cancel") ? .cancel : .default
            alertController.addAction(UIAlertAction(title: option, style: style, handler: { _ in
                completion(index)
            }))
        }
        topMostViewController().present(alertController, animated: true, completion: nil)
    }
    
    /// Get the top most view in the app
    /// — Returns: It returns current foreground UIViewcontroller
    class func topMostViewController() -> UIViewController {
        var topViewController: UIViewController? = UIWindow.key?.rootViewController
        while (topViewController?.presentedViewController) != nil {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController!
    }
}
