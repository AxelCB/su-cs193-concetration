//
//  Concentration.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

class Concentration {
    static let cardsUpdatedNotificationName = "Concentration.cardsUpdated"
    
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0
    private var lastCardTouchDate: Date?
    
    weak var flipCardsDownTimer: Timer?
    
    private var faceUpCards: [Card] {
        return cards.filter { $0.isFaceUp }
    }
    
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
        
        flipCardsDownTimer?.invalidate()
        
        if faceUpCards.count == 1, let onlyFaceUpCard = faceUpCards.first, let indexOfOnlyFaceUpCard = cards.firstIndex(of: onlyFaceUpCard) {
            if indexOfOnlyFaceUpCard != index, onlyFaceUpCard.identifier == cards[index].identifier {
                cards[index].isMatched = true
                cards[indexOfOnlyFaceUpCard].isMatched = true
                if let lastCardTouchDate = lastCardTouchDate {
                    let secondsSinceLastCardTouch = Date().timeIntervalSince(lastCardTouchDate)
                    let scoreBasedOnTime = (3 - Int(secondsSinceLastCardTouch/2))
                    score += (scoreBasedOnTime > 0) ? scoreBasedOnTime : 0
                }
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
            flipCardsDownTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                for faceUpCard in self.faceUpCards {
                    self.cards[self.cards.firstIndex(of: faceUpCard)!].isFaceUp = false
                }
                NotificationCenter.default.post(name: Notification.Name(Concentration.cardsUpdatedNotificationName), object: nil)
            }
        } else {
            for faceUpCard in faceUpCards {
                cards[cards.firstIndex(of: faceUpCard)!].isFaceUp = false
            }
            cards[index].isFaceUp = true
        }
        flipCount += 1
        lastCardTouchDate = Date()
    }
}
