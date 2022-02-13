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
}

class MLItemDetailsInteractor: MLItemDetailsBussinessLogic {
    private let _presenter: MLItemDetailsPresentationLogic
    private let _worker: MLItemDetailsWorker
    
    private let _disposeBag = DisposeBag()
    
    init(presenter: MLItemDetailsPresentationLogic, worker: MLItemDetailsWorker) {
        self._presenter = presenter
        self._worker = worker
    }
    
    func getDetails(id: String) {
        _worker.fetchDetails(id: id)
            .subscribe(onSuccess: { details in
                print(details)
            }, onFailure: { error in
                print(error)
            }).disposed(by: _disposeBag)
    }
}
