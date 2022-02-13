//
//  ItemDetailsSection.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

class ItemDetailsSection: Hashable {
    var id: String = UUID().uuidString
    var items: [ItemDetailsSectionItem]
    
    init(items: [ItemDetailsSectionItem]) {
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ItemDetailsSection, rhs: ItemDetailsSection) -> Bool {
        false
    }
}
