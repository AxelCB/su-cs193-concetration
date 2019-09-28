//
//  ConcentrationTheme.swift
//  Concentration
//
//  Created by Axel Collard Bovy on 28/09/2019.
//  Copyright © 2019 Axel Collard Bovy. All rights reserved.
//

import Foundation

enum ConcentrationTheme {
    case animals
    
    var emojis: [String] {
        switch self {
        case .animals:
            return ["🐶", "🐱", "🐰", "🦁", "🐨", "🐼", "🐵", "🐞", "🐙", "🦕", "🐬", "🕷", "🦋", "🦀"]
        default:
            return []
        }
    }
}
