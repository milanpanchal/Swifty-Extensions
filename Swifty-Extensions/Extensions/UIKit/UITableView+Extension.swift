//
//  UITableView+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UITableView {
    
    func resetScrollPositionToTop() {
        self.contentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
    }
    
    func setEmptyMessage(_ message: String,
                         textColor: UIColor = UIColor.black,
                         messageFont: UIFont = UIFont.systemFont(ofSize: 20)) {
        
        let messageLabel           = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text          = message
        messageLabel.textColor     = textColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font          = messageFont
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore(with separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.backgroundView = nil
        self.separatorStyle = separatorStyle
    }
 
    func selectAllRows() {
        for section in 0..<self.numberOfSections {
            for row in 0..<self.numberOfRows(inSection: section) {
                self.selectRow(at: IndexPath(row: row, section: section), animated: false, scrollPosition: .none)
            }
        }
    }
    
    func deselectAllRows() {
        for section in 0..<self.numberOfSections {
            for row in 0..<self.numberOfRows(inSection: section) {
                self.deselectRow(at: IndexPath(row: row, section: section), animated: false)
            }
        }
    }
    
    func reloadLastRowInSection(section: Int) {
        let lastRowIndex = self.numberOfRows(inSection: section) - 1
        self.reloadRows(at: [IndexPath(row: lastRowIndex, section: section)], with: .none)
    }
        
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }

    func scrollToLastCell() {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if sections > 0 && rows > 0 {
            let indexPath = IndexPath(row: rows - 1, section: sections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
