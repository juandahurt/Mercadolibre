//
//  MLSearchModuleTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 12/02/22.
//

import XCTest
@testable import Mercadolibre

class MLSearchModuleTests: XCTestCase {
    var viewController: MLSearchViewController!
    var interactor: MLSearchBussinessLogic!
    
    override func setUp() {
        super.setUp()
        
        let presenter = MLSearchPresenter()
        interactor = MockSearchInteractor(presenter: presenter)
        viewController = MLSearchViewController(interactor: interactor)
        presenter.viewController = viewController
        
        viewController.loadViewIfNeeded()
    }
    
    func test_view_presents_all_items() {
        interactor.search("")
        let numberOfItemsInScreen = viewController._collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItemsInScreen, Item.test.count)
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


internal extension Item {
    static let empty = Item(id: "", title: "", thumbnail: "", price: 0)
    static let test = [Item](repeating: .empty, count: 10)
}
