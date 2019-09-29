//
//  ViewController.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 27/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    private var currentTheme = ConcentrationTheme.allCases.randomElement()! {
        didSet {
            remainingThemeEmojis = currentTheme.emojis
        }
    }
    private lazy var game = Concentration(pairsOfCards: pairsOfCards)
    
    var pairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }	

    @IBAction private func touchCard(_ sender: UIButton) {
        game.touchedCard(atIndex: cardButtons.firstIndex(of: sender)!)
        updateAllCardButtons()
        updateFlipCountLabel()
    }
    
    private func updateAllCardButtons() {
        for (index, cardButton) in cardButtons.enumerated() {
            let card = game.cards[index]
            if card.isFaceUp {
                cardButton.backgroundColor = currentTheme.facingUpCardBackgroundColor
                cardButton.setTitle(emoji(for: card), for: .normal)
            } else {
                cardButton.backgroundColor = (card.isMatched) ? UIColor.clear : currentTheme.facingDownCardBackgroundColor
                cardButton.setTitle("", for: .normal)
            }
        }
    }
    
    private func updateFlipCountLabel() {
        flipCountLabel.text = "You flipped \(game.flipCount) cards"
    }
    
    @IBAction private func restartGame() {
        game = Concentration(pairsOfCards: pairsOfCards)
        currentTheme = ConcentrationTheme.allCases.randomElement()!
        emojisByCard = [:]
        updateAllCardButtons()
        updateFlipCountLabel()
    }
    
    lazy var remainingThemeEmojis = currentTheme.emojis
    
    var emojisByCard = [UUID: String]()
    
    func emoji(for card: Card) -> String {
        if emojisByCard[card.identifier] == nil {
            emojisByCard[card.identifier] = remainingThemeEmojis.remove(at: remainingThemeEmojis.count.arc4random)
        }
        return emojisByCard[card.identifier] ?? "?"
    }
}
