//
//  MLItemDetailsRouter.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

protocol MLItemDetailsRoutingLogic {
    func show()
}

class MLItemDetailsRouter: MLItemDetailsRoutingLogic {
    private let navigationController: UINavigationController
    weak var viewController: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show() {
        guard let viewController = viewController else {
            return
        }

        navigationController.pushViewController(viewController, animated: true)
    }
}
