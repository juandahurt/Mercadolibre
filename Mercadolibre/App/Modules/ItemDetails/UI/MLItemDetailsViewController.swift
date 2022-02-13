//
//  MLItemDetailsViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class MLItemDetailsViewController: UIViewController {
    private let _itemId: String
    private let _interactor: MLItemDetailsBussinessLogic
    
    init(interactor: MLItemDetailsBussinessLogic, itemId: String) {
        self._interactor = interactor
        self._itemId = itemId
        
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        MLLogger.instance.log("details view is being deallocated", level: .debug)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _interactor.getDetails(id: _itemId)
    }
    
}
