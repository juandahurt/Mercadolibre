//
//  MLItemDetailsPresenter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

protocol MLItemDetailsPresentationLogic {
    func showDetails(_ data: ItemDetails)
}

class MLItemDetailsPresenter: MLItemDetailsPresentationLogic {
    weak var viewController: MLItemDetailsViewController?
    
    func showDetails(_ data: ItemDetails) {
        guard let viewController = viewController else {
            return
        }
        
        let headerSection = ItemDetailsSection(
            items: [
                ItemDetailsHeaderItem(viewModel: MLItemDetailsViewModel(details: data))
            ]
        )
        viewController.applySnapshot(sections: [headerSection])
    }
}
