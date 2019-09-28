//
//  Card.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

struct Card: Equatable {
    var isFaceUp = false
    var isMatched = false
    let identifier = UUID()
    
    
    
    
//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
}
