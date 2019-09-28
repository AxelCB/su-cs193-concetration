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
    
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "You flipped \(flipCount) cards"
        }
    }
    private var currentTheme: ConcentrationTheme = .animals
    private lazy var game = Concentration(pairsOfCards: pairsOfCards)
    
    var pairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }	

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        game.touchedCard(atIndex: cardButtons.firstIndex(of: sender)!)
        updateAllCardButtons()
    }
    
    private func updateAllCardButtons() {
        for (index, cardButton) in cardButtons.enumerated() {
            let card = game.cards[index]
            if card.isFaceUp {
                cardButton.backgroundColor = UIColor.lightGray
                cardButton.setTitle(emoji(for: card), for: .normal)
            } else {
                cardButton.backgroundColor = (card.isMatched) ? UIColor.clear : UIColor.orange
                cardButton.setTitle("", for: .normal)
            }
        }
    }
    
    @IBAction func restartGame() {
        game = Concentration(pairsOfCards: pairsOfCards)
        flipCount = 0
        remainingThemeEmojis = currentTheme.emojis
        emojisByCard = [:]
        updateAllCardButtons()
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
