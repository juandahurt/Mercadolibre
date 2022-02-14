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
        let router = MLSearchRouter(navigationController: UINavigationController())
        let sut = MLSearchViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItemsInScreen = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItemsInScreen, Item.test.count)
    }
    
    func test_presents_next_page_items() {
        let presenter = MLSearchPresenter()
        let interactor = MockSearchInteractor(presenter: presenter)
        let router = MLSearchRouter(navigationController: UINavigationController())
        let sut = MLSearchViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        interactor.nextPage()
        let numberOfItemsInScreen = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItemsInScreen, (Item.test + Item.test).count)
    }
    
    func test_show_empty_result() {
        let presenter = MLSearchPresenter()
        let interactor = MockEmptySearchInteractor(presenter: presenter)
        let router = MLSearchRouter(navigationController: UINavigationController())
        let sut = MLSearchViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItems = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 1)
        let emptyCell = sut._collectionView.dataSource?.collectionView(sut._collectionView, cellForItemAt: .init(row: 0, section: 0))
        XCTAssert(emptyCell is SearchEmptyCollectionViewCell)
    }
    
    func test_show_error() {
        let presenter = MLSearchPresenter()
        let interactor = MockErrorSearchInteractor(presenter: presenter)
        let router = MLSearchRouter(navigationController: UINavigationController())
        let sut = MLSearchViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItems = sut._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 1)
        let emptyCell = sut._collectionView.dataSource?.collectionView(sut._collectionView, cellForItemAt: .init(row: 0, section: 0))
        XCTAssert(emptyCell is SearchErrorCollectionViewCell)
    }
    
    func test_show_loading() {
        let presenter = MLSearchPresenter()
        let interactor = MockLoadingSearchInteractor(presenter: presenter)
        let router = MLSearchRouter(navigationController: UINavigationController())
        let sut = MLSearchViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.search("")
        let numberOfItems = sut._collectionView.numberOfItems(inSection: 1)
        XCTAssertEqual(numberOfItems, 1)
        let emptyCell = sut._collectionView.dataSource?.collectionView(sut._collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(emptyCell is SearchLoadingCollectionViewCell)
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
    
    func nextPage() {
        self.presenter.showSearchResult(items: Item.test + Item.test)
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
    
    func nextPage() {}
}

private class MockErrorSearchInteractor: MLSearchBussinessLogic {
    let presenter: MLSearchPresentationLogic
    
    init(presenter: MLSearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func search(_ text: String) {
        self.presenter.showError(error: TestingSearchError.unknown)
    }
    
    func nextPage() {}
}

private class MockLoadingSearchInteractor: MLSearchBussinessLogic {
    let presenter: MLSearchPresentationLogic
    
    init(presenter: MLSearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func search(_ text: String) {
        self.presenter.showLoading()
    }
    
    func nextPage() {}
}

internal enum TestingSearchError: Error {
    case unknown
}

internal extension Item {
    static let empty = Item(id: "", title: "", thumbnail: "", price: 0)
    static let test = [Item](repeating: .empty, count: 10)
}
