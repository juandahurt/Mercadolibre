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
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show() {
        // TODO: Show view controller
    }
}
