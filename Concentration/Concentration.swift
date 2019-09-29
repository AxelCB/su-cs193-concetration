//
//  Concentration.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0
    
    init(pairsOfCards: Int) {
        for _ in 0..<pairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
    
    func touchedCard(atIndex index: Int) {
        assert(index < cards.count, "Wrong")
        
        guard !cards[index].isMatched else {
            print("Card already matched")
            return
        }
        flipCount += 1
        
        let faceUpCards = cards.filter { $0.isFaceUp }
        if faceUpCards.count == 1, let onlyFaceUpCard = faceUpCards.first, let indexOfOnlyFaceUpCard = cards.firstIndex(of: onlyFaceUpCard) {
            if indexOfOnlyFaceUpCard != index, onlyFaceUpCard.identifier == cards[index].identifier {
                cards[index].isMatched = true
                cards[indexOfOnlyFaceUpCard].isMatched = true
                score += 2
            } else {
                if cards[index].hasBeenSeen {
                    score -= 1
                }
                if cards[indexOfOnlyFaceUpCard].hasBeenSeen {
                    score -= 1
                }
            }
            cards[index].hasBeenSeen = true
            cards[indexOfOnlyFaceUpCard].hasBeenSeen = true
            cards[index].isFaceUp = true
        } else {
            for faceUpCard in faceUpCards {
                cards[cards.firstIndex(of: faceUpCard)!].isFaceUp = false
            }
            cards[index].isFaceUp = true
        }
    }
}
