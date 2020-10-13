//
//  UIControl+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation
import UIKit

extension UIControl {

    private func actionHandler(action:(() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func invoke() {
        self.actionHandler()
    }
    
    func addAction(for control: UIControl.Event = .touchUpInside, _ action: @escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(invoke), for: control)
    }
}
