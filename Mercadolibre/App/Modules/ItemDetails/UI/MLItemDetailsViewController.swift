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
    
    typealias DataSource = UICollectionViewDiffableDataSource<ItemDetailsSection, ItemDetailsSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ItemDetailsSection, ItemDetailsSectionItem>
    
    private var _dataSource: DataSource!
    
    init(interactor: MLItemDetailsBussinessLogic, itemId: String) {
        self._interactor = interactor
        self._itemId = itemId
        
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        MLLogger.instance.log("details view is being deallocated", level: .debug)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _dataSource = _createDataSource()
        _setupLayout()
        collectionView.dataSource = _dataSource
        _interactor.getDetails(id: _itemId)
    }
    
}

// MARK: - Layout
extension MLItemDetailsViewController {
    private func _createDataSource() -> DataSource {
        let headerId = String(describing: ItemDetailsHeaderCollectionViewCell.self)
        collectionView.register(UINib(nibName: headerId, bundle: nil), forCellWithReuseIdentifier: headerId)
        
        return DataSource(
            collectionView: collectionView) { collectionView, indexPath, item in
                if let item = item as? ItemDetailsHeaderItem {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as? ItemDetailsHeaderCollectionViewCell
                    cell?.setViewModel(item.viewModel)
                    return cell
                }
                
                return nil
            }
    }
    
    private func _setupLayout() {
        collectionView.collectionViewLayout =  UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let size = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(80)
            )
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 16, bottom: 0, trailing: 16)
            return section
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
