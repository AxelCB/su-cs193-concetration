//
//  Int+arc4random.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 28/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
