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
    
    func test_show_item_data() {
        let presenter = MLItemDetailsPresenter()
        let interactor = MockItemDetailsInteractor(presenter: presenter)
        let router = MLItemDetailsRouter(navigationController: UINavigationController())
        let sut = MLItemDetailsViewController(interactor: interactor, router: router, itemId: "")
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.getDetails(id: "")
        let numberOfSections = sut.collectionView.numberOfSections
        XCTAssertEqual(numberOfSections, 4)
        
        let headerCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 0))
        XCTAssert(headerCell is ItemDetailsHeaderCollectionViewCell)
        let photoCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(photoCell is ItemDetailsPhotoCollectionViewCell)
        let priceCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 2))
        XCTAssert(priceCell is ItemDetailsPriceCollectionViewCell)
        let buyCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 3))
        XCTAssert(buyCell is ItemDetailsBuyCollectionViewCell)
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

internal class MockItemDetailsInteractor: MLItemDetailsBussinessLogic {
    private let _presenter: MLItemDetailsPresentationLogic
    
    init(presenter: MLItemDetailsPresentationLogic) {
        self._presenter = presenter
    }
    
    func getDetails(id: String) {
        _presenter.showDetails(.test)
    }
    
    func openItemLink(_ link: String) {}
}

internal extension ItemDetails {
    static let test = ItemDetails(
        id: "1",
        title: "Test",
        condition: .new,
        pictures: [ItemPicture(url: "photo.url")],
        soldQuantity: 2,
        price: 100,
        originalPrice: nil,
        permalink: "test.co"
    )
}
