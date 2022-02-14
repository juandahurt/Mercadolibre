//
//  MLSearchRouter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

protocol MLSearchRoutingLogic {
    func show()
    func showItem(identifiedBy id: String)
}

class MLSearchRouter: MLSearchRoutingLogic {
    weak var viewController: UIViewController?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show() {
        guard let viewController = viewController else {
            return
        }
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showItem(identifiedBy id: String) {
        let detailsModule = MLItemDetailsModule.setup(with: navigationController, itemId: id)
        detailsModule.show()
    }
}
