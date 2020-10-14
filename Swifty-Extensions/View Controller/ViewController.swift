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

    // MARK: View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply Shadow to the view
//        setupShadowView()
        shadowView.layer.applySketchShadow(x: 10, y: 10, blur: 10, spread: 3)
    }

    private func setupShadowView() {
        shadowView.layer.shadowOffset  = CGSize(width: 10, height: 10) // Spread x, y
        shadowView.layer.shadowOpacity = 0.5 // opacity, 50%
        shadowView.layer.shadowRadius  = 10 // half of blur
        shadowView.layer.shadowColor   = UIColor.black.cgColor
    }
}
