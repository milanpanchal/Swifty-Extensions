//
//  UIViewController+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        UIView.animate(withDuration: 0.5) {
            self.view.endEditing(true)
        }
    }
    
    var isModelPresent: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }

    func hidenAllSubViews(isHiddenAllSubViews: Bool) {
        _ = self.view.subviews.map({ $0.isHidden = isHiddenAllSubViews })
    }
    
    func presentOnRoot(`with` viewController: UIViewController) {
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(navigationController, animated: false, completion: nil)
    }

    // Custom Back button
    func setBackButton() {
        let leftArrow = UIImage(named: "leftArrow")
        navigationController?.navigationBar.backIndicatorImage = leftArrow
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = leftArrow
        self.navigationController?.navigationBar.topItem?.title = " "
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view as? UIButton != nil {
            return false
        }
        return true
    }

}
