//
//  MLItemDetailsInteractor.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import RxSwift

protocol MLItemDetailsBussinessLogic {
    func getDetails(id: String)
    func openItemLink(_ link: String)
}

class MLItemDetailsInteractor: MLItemDetailsBussinessLogic {
    private let _presenter: MLItemDetailsPresentationLogic
    private let _worker: MLItemDetailsWorker
    
    private let _disposeBag = DisposeBag()
    
    init(presenter: MLItemDetailsPresentationLogic, worker: MLItemDetailsWorker) {
        self._presenter = presenter
        self._worker = worker
    }
    
    deinit {
        MLLogger.instance.log("details interactor is being deallocated", level: .deallocation)
    }
    
    func getDetails(id: String) {
        _presenter.showLoading()
        _worker.fetchDetails(id: id)
            .subscribe(onSuccess: { [weak self] details in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self._presenter.showDetails(details)
                }
            }, onFailure: { error in
                print(error)
            }).disposed(by: _disposeBag)
    }
    
    func openItemLink(_ link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
}
