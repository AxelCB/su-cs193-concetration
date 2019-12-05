//
//  Concentration.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

struct Concentration {
    static let cardsUpdatedNotificationName = "Concentration.cardsUpdated"
    
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0
    private var lastCardTouchDate: Date?
    
    weak var flipCardsDownTimer: Timer?
    
    private var faceUpCards: [Card] {
        get {
            return cards.filter { $0.isFaceUp }
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = newValue.contains(cards[index])
            }
        }
    }
    
    init(pairsOfCards: Int) {
        assert(pairsOfCards > 0, "Concentration.init(\(pairsOfCards)): you must have at least one pair of cards!")
        for _ in 0..<pairsOfCards {
            let matchingValue = Card.getUniqueMatchingValue()
            cards += [Card(matchingValue: matchingValue), Card(matchingValue: matchingValue)]
        }
        cards.shuffle()
    }
    
    mutating func chooseCard(atIndex index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(\(index)): chosen index not in the cards")
        
        guard !cards[index].isMatched else {
            debugPrint("Card already matched")
            return
        }
        
        flipCardsDownTimer?.invalidate()
        
        if faceUpCards.count == 1, let onlyFaceUpCard = faceUpCards.first, let indexOfOnlyFaceUpCard = cards.firstIndex(of: onlyFaceUpCard) {
            if indexOfOnlyFaceUpCard != index, onlyFaceUpCard.matchingValue == cards[index].matchingValue {
                cards[index].isMatched = true
                cards[indexOfOnlyFaceUpCard].isMatched = true
                if let lastCardTouchDate = lastCardTouchDate {
                    let secondsSinceLastCardTouch = Date().timeIntervalSince(lastCardTouchDate)
                    let scoreBasedOnTime = 1 + (3 - Int(secondsSinceLastCardTouch/2))
                    score += (scoreBasedOnTime > 1) ? scoreBasedOnTime : 1
                }
            } else {
                if cards[index].hasBeenSeen {
                    let secondsSinceLastCardTouch = Date().timeIntervalSince(lastCardTouchDate ?? Date())
                    score -= (secondsSinceLastCardTouch > 3) ? 2 : 1
                }
                if cards[indexOfOnlyFaceUpCard].hasBeenSeen {
                    let secondsSinceLastCardTouch = Date().timeIntervalSince(lastCardTouchDate ?? Date())
                    score -= (secondsSinceLastCardTouch > 3) ? 2 : 1
                }
            }
            cards[index].hasBeenSeen = true
            cards[indexOfOnlyFaceUpCard].hasBeenSeen = true
            faceUpCards.append(cards[index])
            flipCardsDownTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                NotificationCenter.default.post(name: Notification.Name(Concentration.cardsUpdatedNotificationName), object: nil)
            }
        } else {
            faceUpCards = [cards[index]]
        }
        flipCount += 1
        lastCardTouchDate = Date()
    }
    
    mutating func flipDownAllCards() {
        faceUpCards = []
    }
}
