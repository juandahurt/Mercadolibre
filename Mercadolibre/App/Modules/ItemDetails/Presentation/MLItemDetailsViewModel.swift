//
//  MLItemDetailsViewModel.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

class MLItemDetailsViewModel {
    let details: ItemDetails
    
    init(details: ItemDetails) {
        self.details = details
    }
    
    var condition: String {
        get {
            switch details.condition {
            case .new:
                return "Nuevo"
            }
        }
    }
}
