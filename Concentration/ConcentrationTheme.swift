//
//  ConcentrationTheme.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 28/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation
import UIKit

enum ConcentrationTheme: CaseIterable {
    case animals
    case sports
    case weather
    case food
    case arts
    case flags
    case fruitsAndVegetables
    
    var emojis: [String] {
        switch self {
        case .animals:
            return ["🐶", "🐱", "🐰", "🦁", "🐨", "🐼", "🐵", "🐞", "🐙", "🦕", "🐬", "🕷", "🦋", "🦀"]
        case .sports:
            return ["🏓", "🎱", "🥏", "🏐", "🎾", "⚾️", "🏈", "🏀", "⚽️", "🏸", "🏒", "🏹", "🛹", "⛷", "🏂", "🏄🏻‍♂️", "🏊🏻‍♀️", "🧗🏻‍♂️", "🚵🏻‍♂️"]
        case .weather:
            return ["☀️", "⛅️", "☁️", "🌧", "⛈", "❄️", "🌪", "🌈", "🌞", "🌛", "☃️", "☔️"]
        case .food:
            return ["🥐", "🧀", "🥨", "🍞", "🥓", "🍗", "🥩", "🌭", "🍔", "🍟", "🍕", "🥪", "🥙", "🌮", "🥗", "🥘"]
        case .arts:
            return ["🎭", "🎨", "🎬", "🎤", "🎧", "🎼", "🎹", "🥁", "🎷", "🎺", "🎸", "🎻"]
        case .flags:
            return ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇦", "🇧🇼", "🇧🇷", "🇮🇴", "🇻🇬", "🇧🇳", "🇧🇬", "🇧🇫", "🇧🇮", "🇰🇭", "🇨🇲", "🇨🇦", "🇮🇨", "🇨🇻", "🇧🇶", "🇰🇾", "🇨🇫", "🇹🇩", "🇨🇱", "🇨🇳", "🇨🇽", "🇨🇨"]
        case .fruitsAndVegetables:
            return ["🥕", "🌽", "🍅", "🍆", "🥑", "🥦", "🥬", "🥝", "🥥", "🌶", "🍍", "🥭", "🍑", "🍒", "🍈", "🍓", "🍇", "🍉", "🍏", "🍎", "🍐", "🍊", "🍋", "🍌"]
        }
    }
    
    var facingDownCardBackgroundColor: UIColor {
        switch self {
        case .animals:
            return #colorLiteral(red: 0, green: 0.3091007502, blue: 0.355339668, alpha: 1)
        case .sports:
            return #colorLiteral(red: 0.862745098, green: 0.3333333333, blue: 0.2235294118, alpha: 1)
        case .weather:
            return #colorLiteral(red: 0.1315022111, green: 0.08890939504, blue: 0.506097436, alpha: 1)
        case .food:
            return #colorLiteral(red: 0.347515647, green: 0.01629785276, blue: 0.5989394077, alpha: 1)
        case .arts:
            return #colorLiteral(red: 0.8413994368, green: 0, blue: 0.5007284254, alpha: 1)
        case .flags:
            return #colorLiteral(red: 0.835042417, green: 0.7542561889, blue: 0.6254884601, alpha: 1)
        case .fruitsAndVegetables:
            return #colorLiteral(red: 0.6618269898, green: 0.8815974746, blue: 0, alpha: 1)
        }
    }
    
    var facingUpCardBackgroundColor: UIColor {
        switch self {
        case .animals:
            return #colorLiteral(red: 0.7464684775, green: 0.7464684775, blue: 0.7464684775, alpha: 1)
        case .sports:
            return #colorLiteral(red: 0.1577261992, green: 0.1577261992, blue: 0.1577261992, alpha: 1)
        case .weather:
            return #colorLiteral(red: 0.03165959939, green: 0.03167161718, blue: 0.03165801242, alpha: 1)
        case .food:
            return #colorLiteral(red: 0.1945320985, green: 0.5961754724, blue: 0.9507630814, alpha: 1)
        case .arts:
            return #colorLiteral(red: 0.08369358629, green: 0.720156908, blue: 0.7133956552, alpha: 1)
        case .flags:
            return #colorLiteral(red: 0.5957826126, green: 0.5957826126, blue: 0.5957826126, alpha: 1)
        case .fruitsAndVegetables:
            return #colorLiteral(red: 0.3980560555, green: 0.5, blue: 0.003100888542, alpha: 1)
        }
    }
    
    var boardBackgroundColor: UIColor {
        switch self {
        case .animals:
            return UIColor.white
        case .sports:
            return UIColor.white
        case .weather:
            return UIColor.white
        case .food:
            return UIColor.white
        case .arts:
            return UIColor.white
        case .flags:
            return UIColor.white
        case .fruitsAndVegetables:
            return UIColor.white
        }
    }
}
