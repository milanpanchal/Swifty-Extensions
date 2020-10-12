//
//  UITextField+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UITextField {

    func underlined() {
        let width = CGFloat(1.0)

        let border = CALayer()
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width,
                              width: self.frame.size.width,
                              height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setLeftView(img: UIImage, width: CGFloat = 50, tintColor: UIColor = .black) {
        let imgView = UIImageView(image: img)
        imgView.contentMode = .center
        imgView.tintColor = tintColor
        self.leftView = imgView
        self.leftViewMode = .always
        self.leftView?.widthAnchor.constraint(equalToConstant: width).isActive = true
        
    }
          
    func setRightView(img: UIImage, width: CGFloat = 50) {
        self.rightView = UIImageView(image: img)
        self.rightViewMode = .always
        self.rightView?.widthAnchor.constraint(equalToConstant: width).isActive = true

    }
    
    func setRightView(normalImgName: String, selectedImgName: String, width: CGFloat = 50) {
        let witnessBtn = UIButton()
        witnessBtn.setImage(UIImage(named: normalImgName)!, for: .normal)
        witnessBtn.setImage(UIImage(named: selectedImgName)!, for: .selected)

        self.rightView = witnessBtn
        self.rightViewMode = .always
        self.rightView?.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        witnessBtn.addAction(for: .touchUpInside) { [unowned self] in
            let isSelected = self.isSecureTextEntry
            self.isSecureTextEntry = !isSelected
            (self.rightView as? UIButton)?.isSelected = isSelected
        }
    }
}
