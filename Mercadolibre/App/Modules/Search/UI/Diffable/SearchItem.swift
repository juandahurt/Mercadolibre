//
//  SearchItem.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

class SearchItem: Hashable {
    var id: String = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SearchItem, rhs: SearchItem) -> Bool {
        false
    }
}

class SearchItemSuccess: SearchItem {
    let viewModel: MLSearchViewModel
    
    init(viewModel: MLSearchViewModel) {
        self.viewModel = viewModel
        super.init()
    }
}

class SearchItemLoading: SearchItem {}

class SearchEmptyItem: SearchItem {}

class SearchErrorItem: SearchItem {}
