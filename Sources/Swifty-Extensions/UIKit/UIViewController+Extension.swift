//
//  UIViewController+Extension.swift
//  Swifty-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /*var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate else { return nil }
         return delegate
    }*/
    
    /// Get the instance of the window
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                   return window
        }
        
        guard let window = UIApplication.shared.delegate?.window else { return nil }
        return window
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

    /// Custom Back button
    func setBackButton(backButtonImg: UIImage) {
        navigationController?.navigationBar.backIndicatorImage = backButtonImg
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImg
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    /// Hide the navigation bar on the this view controller
    func hideNavigationBar(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /// Show the navigation bar on other view controllers
    func showNavigationBar(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    /// Remove all child view controller from current view controller
    func removeAllChildViewController() {
        self.children.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
    }

    /// Remove top child view controller from current view controller
    func removeTopChildViewController() {
        if let topChildVC = self.children.last {
            topChildVC.willMove(toParent: nil)
            topChildVC.view.removeFromSuperview()
            topChildVC.removeFromParent()
        }
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view as? UIButton != nil {
            return false
        }
        return true
    }

}
