//
//  MLSearchViewModel.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

protocol SearchViewModel {
    var item: Item { get set }
    
    func getFormattedPrice() -> String
}

class MLSearchViewModel: SearchViewModel {
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func getFormattedPrice() -> String {
        "$ \(item.price)"
    }
}
