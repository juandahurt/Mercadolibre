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
        // TODO: Update view controller
    }
}
