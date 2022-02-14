//
//  MLItemDetailsModuleTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 14/02/22.
//

import XCTest
@testable import Mercadolibre

class MLItemDetailsModuleTests: XCTestCase {
    func test_show_loader() {
        let presenter = MLItemDetailsPresenter()
        let interactor = MockLoadingItemDetailsInteractor(presenter: presenter)
        let router = MLItemDetailsRouter(navigationController: UINavigationController())
        let sut = MLItemDetailsViewController(interactor: interactor, router: router, itemId: "")
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.getDetails(id: "")
        let numberOfItems = sut.collectionView.numberOfItems(inSection: 1)
        XCTAssertEqual(numberOfItems, 1)
        
        let emptyCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(emptyCell is ItemDetailsLoadingCollectionViewCell)
    }
}

// MARK: - Helpers

internal class MockLoadingItemDetailsInteractor: MLItemDetailsBussinessLogic {
    private let _presenter: MLItemDetailsPresentationLogic
    
    init(presenter: MLItemDetailsPresentationLogic) {
        self._presenter = presenter
    }
    
    func getDetails(id: String) {
        _presenter.showLoading()
    }
    
    func openItemLink(_ link: String) {}
}
