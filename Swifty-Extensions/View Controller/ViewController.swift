//
//  ViewController.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    @IBOutlet private weak var shadowView: UIView! {
        didSet {
            shadowView.backgroundColor = UIColor(hexString: "#912626")
            shadowView.layer.cornerRadius  = 12
        }
    }

    @IBOutlet private weak var barcodeImgView: UIImageView!
    
    // MARK: View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply Shadow to the view
//        setupShadowView()
        shadowView.layer.applySketchShadow(x: 10, y: 10, blur: 10, spread: 3)
        generatePDF417Barcode()
        addDisclosureBtn()
    }

    private func setupShadowView() {
        shadowView.layer.shadowOffset  = CGSize(width: 10, height: 10) // Spread x, y
        shadowView.layer.shadowOpacity = 0.5 // opacity, 50%
        shadowView.layer.shadowRadius  = 10 // half of blur
        shadowView.layer.shadowColor   = UIColor.black.cgColor
    }
    
    private func generatePDF417Barcode() {
//        barcodeImgView.image = "123456789".toPDF417Barcode
        barcodeImgView.image = "A-0201-ALD".toCode128Barcode
        
        barcodeImgView.image = BarcodeGenerator.generate(from: "A-0201-ALD", descriptor: .code128, size: CGSize(width: barcodeImgView.frame.width, height: barcodeImgView.frame.height))

    }
    
    private func addDisclosureBtn() {
        let btn = UIButton(frame: CGRect(x: 20, y: 40, width: 200, height: 50))
        let img = UIImage(systemName: "chevron.right.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        btn.disclosureButton(titleColor: UIColor.darkGray, image: img!)
        btn.setTitle("Test", for: .normal)
        self.view.addSubview(btn)

    }
}
