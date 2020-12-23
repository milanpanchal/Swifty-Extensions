//
//  String+Barcode.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 22/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// Generate PDF417 barcode using string
    ///
    /// PDF417 is a stacked linear barcode format used in a variety of applications such as transport, identification cards, and inventory management. "PDF" stands for Portable Data File. The "417" signifies that each pattern in the code consists of 4 bars and spaces in a pattern that is 17 units (modules) long.
    ///
    /// returns a UIImage containing the PDF417 barcode representing that string
    ///
    //// Usage: let image = "some string".toPDF417Barcode
    
    var toPDF417Barcode: UIImage? {

        guard let filter = CIFilter(name: "CIPDF417BarcodeGenerator"),
            let data = self.data(using: String.Encoding.ascii) else {
            return nil
        }

        
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 3, y: 3)

        guard let output = filter.outputImage?.transformed(by: transform) else {
            return nil
        }

        return UIImage(ciImage: output)
    }
    
    /// Generate Code 128 barcode using string

    var toCode128Barcode: UIImage? {

        guard let filter = CIFilter(name: "CICode128BarcodeGenerator"),
            let data = self.data(using: String.Encoding.ascii) else {
            return nil
        }

        filter.setValue(data, forKey: "inputMessage")
        
        guard let output = filter.outputImage else {
            return nil
        }

        return UIImage(ciImage: output)
    }
}
