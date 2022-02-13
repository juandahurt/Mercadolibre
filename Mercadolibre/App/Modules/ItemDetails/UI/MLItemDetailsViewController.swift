//
//  MLItemDetailsViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class MLItemDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        MLLogger.instance.log("details view is being deallocated", level: .debug)
    }
}
