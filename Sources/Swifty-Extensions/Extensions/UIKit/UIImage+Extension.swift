//
//  UIImage+Extension.swift
//  Swift-Extension
//
//  Created by MilanPanchal on 05/06/16.
//  Copyright © 2016 JeenalInfotech. All rights reserved.
//

import UIKit

public extension UIImage {
    
    var convertToBase64: String? {
        return self.pngData()?.base64EncodedString(options: .lineLength64Characters)
    }
    
    /// Returns compressed image to rate from 0 to 1
    func compressImage(rate: CGFloat) -> Data? {
        return self.jpegData(compressionQuality: rate)
    }
    
    /// Returns Image size in Bytes
    func getSizeAsBytes() -> Int {
        return self.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    /// Returns Image size in Kylobites
    func getSizeAsKilobytes() -> Int {
        return getSizeAsBytes() / 1024
    }
        
    func aspectHeightForWidth(width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    func aspectWidthForHeight(height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    
    /// Returns an empty image //TODO: Add to readme
    class func blankImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// Get the new image with alpha
    func alpha(_ value: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
