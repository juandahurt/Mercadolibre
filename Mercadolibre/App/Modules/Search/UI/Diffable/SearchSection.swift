//
//  SearchSection.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

class SearchSection: Hashable {
    var id: String = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SearchSection, rhs: SearchSection) -> Bool {
        false
    }
}
