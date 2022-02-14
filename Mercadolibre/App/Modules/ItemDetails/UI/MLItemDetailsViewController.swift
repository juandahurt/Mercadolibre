//
//  MLItemDetailsViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class MLItemDetailsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let _itemId: String
    private let _interactor: MLItemDetailsBussinessLogic
    private let _router: MLItemDetailsRoutingLogic
    
    typealias DataSource = UICollectionViewDiffableDataSource<ItemDetailsSection, ItemDetailsSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ItemDetailsSection, ItemDetailsSectionItem>
    
    private var _dataSource: DataSource!
    
    init(interactor: MLItemDetailsBussinessLogic, router: MLItemDetailsRoutingLogic, itemId: String) {
        self._interactor = interactor
        self._router = router
        self._itemId = itemId
        
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        MLLogger.instance.log("details view is being deallocated", level: .deallocation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _dataSource = _createDataSource()
        _setupLayout()
        collectionView.dataSource = _dataSource
        _interactor.getDetails(id: _itemId)
    }
    
    @IBAction func backOnTap(_ sender: UIButton) {
        _router.goBack()
    }
}

// MARK: - Layout
extension MLItemDetailsViewController {
    private func _createDataSource() -> DataSource {
        let headerId = String(describing: ItemDetailsHeaderCollectionViewCell.self)
        collectionView.register(UINib(nibName: headerId, bundle: nil), forCellWithReuseIdentifier: headerId)
        
        let photoId = String(describing: ItemDetailsPhotoCollectionViewCell.self)
        collectionView.register(UINib(nibName: photoId, bundle: nil), forCellWithReuseIdentifier: photoId)
        
        let priceId = String(describing: ItemDetailsPriceCollectionViewCell.self)
        collectionView.register(UINib(nibName: priceId, bundle: nil), forCellWithReuseIdentifier: priceId)
        
        let buyId = String(describing: ItemDetailsBuyCollectionViewCell.self)
        collectionView.register(UINib(nibName: buyId, bundle: nil), forCellWithReuseIdentifier: buyId)
        
        let loadingId = String(describing: ItemDetailsLoadingCollectionViewCell.self)
        collectionView.register(UINib(nibName: loadingId, bundle: nil), forCellWithReuseIdentifier: loadingId)
        
        return DataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, item in
                guard let self = self else { return nil }
            
                if let item = item as? ItemDetailsHeaderItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as? ItemDetailsHeaderCollectionViewCell
                    cell?.setViewModel(item.viewModel)
                    return cell
                }
                if let item = item as? ItemDetailsPhotoItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoId, for: indexPath) as? ItemDetailsPhotoCollectionViewCell
                    cell?.setViewModel(item.viewModel)
                    return cell
                }
                if let item = item as? ItemDetailsPriceItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: priceId, for: indexPath) as? ItemDetailsPriceCollectionViewCell
                    cell?.setViewModel(item.viewModel)
                    return cell
                }
                if let item = item as? ItemDetailsBuyItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: buyId, for: indexPath) as? ItemDetailsBuyCollectionViewCell
                    cell?.buyOnTap = { [weak self] in
                        guard let self = self else { return }
                        
                        self._interactor.openItemLink(item.link)
                    }
                    return cell
                }
                if item is ItemDetailsLoadingItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loadingId, for: indexPath)
                    return cell
                }
                
                return nil
            }
    }
    
    private func _setupLayout() {
        collectionView.collectionViewLayout =  UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(80)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
                return section
            } else if sectionIndex == 1 {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.3)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = .init(top: 15, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            } else if sectionIndex == 2 {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(50)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
                return section
            } else {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(105)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
                return section
            }
        })
    }
    
    func applySnapshot(sections: [ItemDetailsSection]) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        _dataSource.apply(snapshot)
    }
}
