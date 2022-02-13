//
//  MLItemDetailsModule.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

class MLItemDetailsModule {
    private let viewController: MLItemDetailsViewController
    private let router: MLItemDetailsRouter
    
    private init(navigationController: UINavigationController, itemId: String) {
        router = MLItemDetailsRouter(navigationController: navigationController)
        let presenter = MLItemDetailsPresenter()
        let worker = MLItemDetailsNetworkWorker()
        let interactor = MLItemDetailsInteractor(presenter: presenter, worker: worker)
        viewController = MLItemDetailsViewController(interactor: interactor, router: router, itemId: itemId)
        router.viewController = viewController
        presenter.viewController = viewController
    }
    
    static func setup(with navigationController: UINavigationController, itemId: String) -> MLItemDetailsModule {
        MLItemDetailsModule(navigationController: navigationController, itemId: itemId)
    }
    
    func show() {
        router.show()
    }
}
