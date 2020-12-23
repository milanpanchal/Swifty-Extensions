//
//  UIButton+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UIButton {

    open override var isEnabled: Bool {
        didSet {
            self.alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    func transformImageToRight(leftPadding: CGFloat = 0.0) {
        
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        
    }
    
    /*
     Add right arrow disclosure indicator to the button with normal and
     highlighted colors for the title text and the image
     
     NOTE:
     It is important to call the `disclosureButton` method in the `viewDidLayoutSubviews` method, and not `viewWillAppear`, so that the button is always setup after the bounds are known for the button.
     */
    func disclosureButton(titleColor: UIColor, borderColor: UIColor = .darkGray, image: UIImage) {
        
        self.contentHorizontalAlignment = .left

        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor.withAlphaComponent(0.3), for: .highlighted)

        guard let imageHighlight = image.alpha(0.3)?.withRenderingMode(.alwaysTemplate) else {
            return
        }
        
        self.imageView?.contentMode = .scaleAspectFit
        
        self.setImage(image, for: .normal)
        self.setImage(imageHighlight, for: .highlighted)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.bounds.size.width-image.size.width*1.5, bottom: 0, right: 0)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.cgColor
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
