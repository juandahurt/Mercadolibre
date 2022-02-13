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

class ItemDetailsPhotoItem: ItemDetailsSectionItem {
    let viewModel: MLItemDetailsPictureViewModel
    
    init(viewModel: MLItemDetailsPictureViewModel) {
        self.viewModel = viewModel
    }
}

class ItemDetailsPriceItem: ItemDetailsSectionItem {
    let viewModel: MLItemDetailsPriceViewModel
    
    init(viewModel: MLItemDetailsPriceViewModel) {
        self.viewModel = viewModel
    }
}

class ItemDetailsBuyItem: ItemDetailsSectionItem {
    let link: String
    
    init(link: String) {
        self.link = link
    }
}
