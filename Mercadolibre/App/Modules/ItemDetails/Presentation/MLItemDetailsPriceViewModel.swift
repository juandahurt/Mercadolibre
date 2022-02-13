//
//  MLItemDetailsPriceViewModel.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

class MLItemDetailsPriceViewModel {
    private let details: ItemDetails
    
    init(details: ItemDetails) {
        self.details = details
    }
    
    var hasDiscount: Bool {
        if let originalPrice = details.originalPrice {
            return originalPrice > details.price
        } else {
            return false
        }
    }
    
    var price: String {
        "$ \(details.price)"
    }
    
    var discount: String {
        let originalPrice = details.originalPrice ?? 0
        let discount = Int(100 - (details.price * 100 / originalPrice))
        return "% \(discount) OFF"
    }
    
    var originalPrice: String {
        let originalPrice = details.originalPrice ?? 0
        return "$ \(originalPrice)"
    }
}
