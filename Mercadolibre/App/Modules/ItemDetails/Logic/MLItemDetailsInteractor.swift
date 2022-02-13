//
//  MLItemDetailsInteractor.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

protocol MLItemDetailsBussinessLogic {
    func getDetails(id: String)
}

class MLItemDetailsInteractor: MLItemDetailsBussinessLogic {
    private let presenter: MLItemDetailsPresentationLogic
    
    init(presenter: MLItemDetailsPresentationLogic) {
        self.presenter = presenter
    }
    
    func getDetails(id: String) {
        // TODO: Create netowork worker
        presenter.showDetails(ItemDetails(id: id))
    }
}
