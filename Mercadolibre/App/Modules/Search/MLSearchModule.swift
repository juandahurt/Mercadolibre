//
//  MLSearchModule.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation
import UIKit

class MLSearchModule {
    private let navigationController: UINavigationController
    private let view: MLSearchViewController
    
    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        view = MLSearchViewController()
    }
    
    static func setup(with navigationController: UINavigationController) -> MLSearchModule {
        MLSearchModule(navigationController: navigationController)
    }
    
    func show() {
        navigationController.pushViewController(view, animated: false)
    }
}
