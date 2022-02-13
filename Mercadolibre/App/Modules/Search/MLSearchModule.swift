//
//  MLSearchModule.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation
import UIKit

class MLSearchModule {
    private let router: MLSearchRouter
    private let view: MLSearchViewController
    
    private init(navigationController: UINavigationController) {
        router = MLSearchRouter(navigationController: navigationController)
        let presenter = MLSearchPresenter()
        let worker = MLSearchNetworkWorker()
        let interactor = MLSearchInteractor(presenter: presenter, worker: worker)
        view = MLSearchViewController(interactor: interactor, router: router)
        
        presenter.viewController = view
        router.viewController = view
    }
    
    static func setup(with navigationController: UINavigationController) -> MLSearchModule {
        MLSearchModule(navigationController: navigationController)
    }
    
    func show() {
        router.show()
    }
}
