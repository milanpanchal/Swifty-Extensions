//
//  UIScrollView+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 13/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

extension UIScrollView {
   
   // Scroll to a specific view so that it's top is at the top our scrollview
   func scrollToView(view:UIView, animated: Bool) {
       if let origin = view.superview {
           UIView.animate(withDuration: 0.4, animations: {
               let childStartPoint = origin.convert(view.frame.origin, to: self)               
               self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y, width:1, height:self.frame.height), animated: animated)
           })
       }
   }
   
   func scrollToTop(animated: Bool) {
       let topOffset = CGPoint(x: 0, y: -contentInset.top)
       setContentOffset(topOffset, animated: animated)
   }
   
   func scrollToBottom() {
       let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
       if(bottomOffset.y > 0) {
           setContentOffset(bottomOffset, animated: true)
       }
   }
}
