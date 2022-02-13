//
//  MLSearchViewModel.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

class MLSearchViewModel {
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    var hasDiscount: Bool {
        if let originalPrice = item.originalPrice {
            return originalPrice > item.price
        } else {
            return false
        }
    }
    
    var discount: String {
        let originalPrice = item.originalPrice ?? 0
        let discount = Int(100 - (item.price * 100 / originalPrice))
        return "% \(discount) OFF"
    }
    
    func getFormattedPrice() -> String {
        "$ \(item.price)"
    }
}
