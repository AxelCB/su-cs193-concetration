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
            return UIColor.orange
        case .sports:
            return UIColor.yellow
        case .weather:
            return UIColor.yellow
        case .food:
            return UIColor.yellow
        case .arts:
            return UIColor.yellow
        case .flags:
            return UIColor.yellow
        case .fruitsAndVegetables:
            return UIColor.yellow
        }
    }
    
    var facingUpCardBackgroundColor: UIColor {
        switch self {
        case .animals:
            return UIColor.lightGray
        case .sports:
            return UIColor.yellow
        case .weather:
            return UIColor.yellow
        case .food:
            return UIColor.yellow
        case .arts:
            return UIColor.yellow
        case .flags:
            return UIColor.yellow
        case .fruitsAndVegetables:
            return UIColor.yellow
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
