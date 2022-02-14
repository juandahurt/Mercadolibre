//
//  MLItemDetailsPresenter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

protocol MLItemDetailsPresentationLogic {
    func showLoading()
    func showDetails(_ data: ItemDetails)
}

class MLItemDetailsPresenter: MLItemDetailsPresentationLogic {
    weak var viewController: MLItemDetailsViewController?
    
    deinit {
        MLLogger.instance.log("details presenter is being deallocated", level: .debug)
    }
    
    func showLoading() {
        let emptySection = ItemDetailsSection(items: [])
        let loadingSection = ItemDetailsSection(
            items: [ ItemDetailsLoadingItem() ]
        )
        viewController?.applySnapshot(sections: [emptySection, loadingSection])
    }
    
    func showDetails(_ data: ItemDetails) {
        guard let viewController = viewController else {
            return
        }
        
        let headerSection = ItemDetailsSection(
            items: [
                ItemDetailsHeaderItem(viewModel: MLItemDetailsViewModel(details: data))
            ]
        )
        let photoItems = data.pictures.map({
            ItemDetailsPhotoItem(viewModel: MLItemDetailsPictureViewModel(picture: $0))
        })
        let photoSection = ItemDetailsSection(
            items: photoItems
        )
        let priceSection = ItemDetailsSection(
            items: [
                ItemDetailsPriceItem(viewModel: MLItemDetailsPriceViewModel(details: data))
            ]
        )
        let buySection = ItemDetailsSection(items: [ItemDetailsBuyItem(link: data.permalink)])
        viewController.applySnapshot(
            sections: [
                headerSection,
                photoSection,
                priceSection,
                buySection
            ]
        )
    }
}
