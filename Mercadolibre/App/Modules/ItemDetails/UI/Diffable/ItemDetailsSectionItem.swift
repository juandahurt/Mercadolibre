//
//  ItemDetailsSectionItem.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

class ItemDetailsSectionItem: Hashable {
    var id: String = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ItemDetailsSectionItem, rhs: ItemDetailsSectionItem) -> Bool {
        false
    }
}

class ItemDetailsHeaderItem: ItemDetailsSectionItem {
    let viewModel: MLItemDetailsViewModel
    
    init(viewModel: MLItemDetailsViewModel) {
        self.viewModel = viewModel
    }
}
