//
//  MLSearchInteractor.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import Foundation
import RxSwift

protocol MLSearchBussinessLogic {
    func search(_ text: String)
}

class MLSearchInteractor: MLSearchBussinessLogic {
    private let presenter: MLSearchPresentationLogic
    private let worker: MLSearchWorker
    
    private let disposeBag = DisposeBag()
    
    init(presenter: MLSearchPresentationLogic, worker: MLSearchWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func search(_ text: String) {
        presenter.showLoading()
        worker.fetchItems(from: text)
            .subscribe(onSuccess: { [weak self] items in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.presenter.showSearchResult(items: items)
                }
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.presenter.showError(error: error)
                }
            }).disposed(by: disposeBag)
    }
}
