//
//  MLSearchViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import RxCocoa
import RxSwift
import UIKit

class MLSearchViewController: UIViewController {
    @IBOutlet private weak var searchBarView: UISearchBar! {
        didSet {
            searchBarView.searchTextField.backgroundColor = .white
            searchBarView.searchTextField.layer.masksToBounds = true
            searchBarView.searchTextField.layer.cornerRadius = 15
            searchBarView.backgroundImage = UIImage()
            searchBarView.searchTextField.placeholder = "Buscar en Mercado Libre"
        }
    }
    
    private let disposeBag = DisposeBag()
    
    private let interactor: MLSearchBussinessLogic
    
    init(interactor: MLSearchBussinessLogic) {
        self.interactor = interactor
        
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rxBind()
    }
    
    private func rxBind() {
        searchBarView.searchTextField.rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .filter({ !$0.isEmpty })
            .subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                
                self.interactor.search(query)
            }).disposed(by: disposeBag)
    }
}
