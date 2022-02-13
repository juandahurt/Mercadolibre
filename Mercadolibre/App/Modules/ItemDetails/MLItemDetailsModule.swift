//
//  MLItemDetailsModule.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

class MLItemDetailsModule {
    private let router: MLItemDetailsRouter
    
    private init(navigationController: UINavigationController) {
        router = MLItemDetailsRouter(navigationController: navigationController)
    }
    
    static func setup(with navigationController: UINavigationController) -> MLItemDetailsModule {
        MLItemDetailsModule(navigationController: navigationController)
    }
    
    func show(id: String) {
        router.show()
    }
}
