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
    func nextPage()
}

class MLSearchInteractor: MLSearchBussinessLogic {
    private let presenter: MLSearchPresentationLogic
    private let worker: MLSearchWorker
    
    private var _paging: ItemPaging
    private var _query = ""
    private var _items: [Item] = []
    
    private let disposeBag = DisposeBag()
    
    init(presenter: MLSearchPresentationLogic, worker: MLSearchWorker) {
        self.presenter = presenter
        self.worker = worker
        self._paging = ItemPaging(total: 0, results: 0, offset: 0, limit: 15)
    }
    
    func search(_ text: String) {
        _query = text
        presenter.showLoading()
        _paging = ItemPaging(total: 0, results: 0, offset: 0, limit: 15)
        worker.fetchItems(from: text, offset: _paging.limit, limit: _paging.limit)
            .subscribe(onSuccess: { [weak self] items, paging  in
                guard let self = self else { return }
                self._paging = paging
                self._items = items
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
    
    func nextPage() {
        guard _paging.results > 0 && (_paging.limit + _paging.offset) < _paging.results else {
            return
        }
        let offset = _paging.offset + _paging.limit
        worker.fetchItems(from: _query, offset: offset, limit: _paging.limit)
            .subscribe(onSuccess: { [weak self] items, paging  in
                guard let self = self else { return }
                self._paging = paging
                DispatchQueue.main.async {
                    self._items.append(contentsOf: items)
                    self.presenter.showSearchResult(items: self._items)
                }
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.presenter.showError(error: error)
                }
            }).disposed(by: disposeBag)
    }
}
