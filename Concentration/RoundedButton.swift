//
//  RoundedButton.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 29/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    @IBInspectable var cornerRadius: Double = 0.0 {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = CGFloat(cornerRadius)
    }

}
