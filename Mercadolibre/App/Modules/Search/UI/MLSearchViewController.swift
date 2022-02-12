//
//  MLSearchViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import UIKit

class MLSearchViewController: UIViewController {
    @IBOutlet private weak var searchBarView: UISearchBar! {
        didSet {
            searchBarView.searchTextField.backgroundColor = .white
            searchBarView.searchTextField.layer.masksToBounds = true
            searchBarView.searchTextField.layer.cornerRadius = 15
            searchBarView.backgroundImage = UIImage()
//            searchBarView.searchTextField.font = Style.font.h3Regular
//            searchBarView.searchTextField.textColor = Style.color.gray
            searchBarView.searchTextField.placeholder = "Buscar en Mercado Libre"
        }
    }
    
    init() {
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
