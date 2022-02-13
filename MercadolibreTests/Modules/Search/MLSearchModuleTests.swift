//
//  MLSearchModuleTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 12/02/22.
//

import XCTest
@testable import Mercadolibre

class MLSearchModuleTests: XCTestCase {
    func test_view_presents_all_items() {
        let presenter = MLSearchPresenter()
        let interactor = MockSearchInteractor(presenter: presenter)
        let sut = MLSearchViewController(interactor: interactor)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItemsInScreen = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItemsInScreen, Item.test.count)
    }
    
    func test_show_empty_result() {
        let presenter = MLSearchPresenter()
        let interactor = MockEmptySearchInteractor(presenter: presenter)
        let sut = MLSearchViewController(interactor: interactor)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItems = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 1)
        let emptyCell = sut._collectionView.dataSource?.collectionView(sut._collectionView, cellForItemAt: .init(row: 0, section: 0))
        XCTAssert(emptyCell is SearchEmptyCollectionViewCell)
    }
}


// MARK: - Helpers
private class MockSearchInteractor: MLSearchBussinessLogic {
    let presenter: MLSearchPresentationLogic
    
    init(presenter: MLSearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func search(_ text: String) {
        self.presenter.showSearchResult(items: Item.test)
    }
}

private class MockEmptySearchInteractor: MLSearchBussinessLogic {
    let presenter: MLSearchPresentationLogic
    
    init(presenter: MLSearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func search(_ text: String) {
        self.presenter.showSearchResult(items: [])
    }
}


internal extension Item {
    static let empty = Item(id: "", title: "", thumbnail: "", price: 0)
    static let test = [Item](repeating: .empty, count: 10)
}
