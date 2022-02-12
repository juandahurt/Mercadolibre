//
//  MLSearchPresenter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation

protocol MLSearchPresentationLogic {
    func showSearchResult(items: [Item])
    func showError(error: Error)
}

class MLSearchPresenter: MLSearchPresentationLogic {
    weak var viewController: MLSearchViewController?
    
    func showSearchResult(items: [Item]) {
        let items = items.map({ SearchItemSuccess(data: $0) })
        viewController?.applySnapshot(items: items)
    }
    
    func showError(error: Error) {
        // TODO: Show error
    }
}


