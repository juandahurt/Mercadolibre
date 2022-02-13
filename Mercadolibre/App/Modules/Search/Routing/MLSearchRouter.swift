//
//  MLSearchRouter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

protocol SearchRoutingLogic {
    func show()
    func showItem(identifiedBy id: String)
}

class MLSearchRouter: SearchRoutingLogic {
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
        // TODO: Go to item details module
    }
}
