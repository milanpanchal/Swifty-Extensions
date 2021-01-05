//
//  UICollectionView+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

public extension UICollectionView {
        
    func resetScrollPositionToTop() {
        self.contentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
    }

    func setEmptyMessage(_ message: String,
                         textColor: UIColor = UIColor.black,
                         messageFont: UIFont = UIFont.systemFont(ofSize: 20)) {
        let messageLabel           = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 1))
        messageLabel.text          = message
        messageLabel.textColor     = textColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font          = messageFont
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
    func restore(with separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.backgroundView = nil
    }
}
