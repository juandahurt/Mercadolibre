//
//  MLLogger.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation

class MLLogger {
    static let instance = MLLogger()
    
    let modifiers: [MLLogModifier]
    
    init(modifiers: [MLLogModifier] = []) {
        self.modifiers = modifiers
    }
    
    func log(_ text: String, level: MLLogLevel) {
        var text = text
        for modifier in modifiers {
            text = modifier.modify(text, level: level)
        }
        print(text)
    }
}
