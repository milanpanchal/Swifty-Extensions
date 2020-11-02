//
//  UINavigationItem+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 02/11/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    /// Set Navigation title and subtitle
    func setTitle(_ title: String, subtitle: String) {
        let appearance          = UINavigationBar.appearance()
        let textColor           = appearance.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor ?? .black
        
        let titleLabel          = UILabel()
        titleLabel.text         = title
        titleLabel.font         = .preferredFont(forTextStyle: UIFont.TextStyle.headline)
        titleLabel.textColor    = textColor
        
        let subtitleLabel       = UILabel()
        subtitleLabel.text      = subtitle
        subtitleLabel.font      = .preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        subtitleLabel.textColor = textColor.withAlphaComponent(0.75)
        
        let stackView           = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution  = .equalCentering
        stackView.alignment     = .center
        stackView.axis          = .vertical
        
        self.titleView          = stackView
    }
}
