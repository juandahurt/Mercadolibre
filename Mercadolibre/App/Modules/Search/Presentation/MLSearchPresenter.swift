//
//  MLSearchPresenter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation

protocol MLSearchPresentationLogic {
    func showSearchResult(items: [Item])
    func showError()
}

class MLSearchPresenter: MLSearchPresentationLogic {
    weak var viewController: MLSearchViewController?
    
    func showSearchResult(items: [Item]) {
        print(items)
    }
    
    func showError() {
        
    }
}


