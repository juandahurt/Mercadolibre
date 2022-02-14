//
//  MLLogModifier.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation

protocol MLLogModifier {
    func modify(_ text: String, level: MLLogLevel) -> String
}

class EmojiLogModifier: MLLogModifier {
    func modify(_ text: String, level: MLLogLevel) -> String {
        let emoji = _getEmoji(for: level)
        
        return "\(emoji) \(text)"
    }
    
    private func _getEmoji(for level: MLLogLevel) -> String {
        switch level {
        case .debug:
            return "🐛"
        case .deallocation:
            return "🗑"
        case .info:
            return "ℹ️"
        }
    }
}
