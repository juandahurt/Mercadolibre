//
//  MLSearchPresenter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation

protocol MLSearchPresentationLogic {
    func showLoading()
    func showSearchResult(items: [Item])
    func showError(error: Error)
}

class MLSearchPresenter: MLSearchPresentationLogic {
    weak var viewController: MLSearchViewController?
    
    func showLoading() {
        let sections = [
            SearchSection(items: []),
            SearchSection(items: [SearchItemLoading()])
        ]
        viewController?.applySnapshot(sections: sections)
    }
    
    func showSearchResult(items: [Item]) {
        if items.isEmpty {
            let sections = [
                SearchSection(items: [SearchEmptyItem()]),
            ]
            viewController?.applySnapshot(sections: sections)
        } else {
            let items = items.map({ SearchItemSuccess(viewModel: MLSearchViewModel(item: $0)) })
            let section = SearchSection(items: items)
            viewController?.applySnapshot(sections: [section])
        }
    }
    
    func showError(error: Error) {
        // TODO: Show error
    }
}


