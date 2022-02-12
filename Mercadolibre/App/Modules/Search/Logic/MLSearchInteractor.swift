//
//  MLSearchInteractor.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation


protocol MLSearchBussinessLogic {
    func search(_ text: String)
}

class MLSearchInteractor: MLSearchBussinessLogic {
    var presenter: MLSearchPresentationLogic
    
    init(presenter: MLSearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func search(_ text: String) {
        // TODO: Call the network worker
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter.showSearchResult(items: [])
        }
    }
}
