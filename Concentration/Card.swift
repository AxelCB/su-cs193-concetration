//
//  Card.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    var hasBeenSeen = false
    var matchingValue: Int
    private let identifier = UUID()
    
    init(matchingValue: Int) {
        self.matchingValue = matchingValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(matchingValue)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var matchingValueFactory = 0
    
    static func getUniqueMatchingValue() -> Int {
        matchingValueFactory += 1
        return matchingValueFactory
    }
}
