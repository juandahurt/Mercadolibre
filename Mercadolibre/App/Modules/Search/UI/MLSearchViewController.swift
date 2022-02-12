//
//  MLSearchViewController.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 11/02/22.
//

import RxCocoa
import RxSwift
import UIKit

class MLSearchViewController: UIViewController {
    @IBOutlet private weak var _searchBarView: UISearchBar! {
        didSet {
            _searchBarView.searchTextField.backgroundColor = .white
            _searchBarView.searchTextField.layer.masksToBounds = true
            _searchBarView.searchTextField.layer.cornerRadius = 15
            _searchBarView.backgroundImage = UIImage()
            _searchBarView.searchTextField.placeholder = "Buscar en Mercado Libre"
        }
    }
    @IBOutlet weak var _collectionView: UICollectionView!
    
    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, SearchItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection, SearchItem>
    
    private let _disposeBag = DisposeBag()
    private let _interactor: MLSearchBussinessLogic
    
    private var _dataSource: DataSource!
    
    init(interactor: MLSearchBussinessLogic) {
        _interactor = interactor
        
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _rxBind()
        _dataSource = _createDataSource()
        _collectionView.dataSource = _dataSource
        _setupLayout()
    }
    
    private func _rxBind() {
        _searchBarView.searchTextField.rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .filter({ !$0.isEmpty })
            .subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                
                self._interactor.search(query)
            }).disposed(by: _disposeBag)
    }
}

// MARK: - Layout
extension MLSearchViewController {
    private func _createDataSource() -> DataSource {
        let successId = String(describing: SearchCollectionViewCell.self)
        _collectionView.register(UINib(nibName: successId, bundle: nil), forCellWithReuseIdentifier: successId)
        
        let loadingId = String(describing: SearchLoadingCollectionViewCell.self)
        _collectionView.register(UINib(nibName: loadingId, bundle: nil), forCellWithReuseIdentifier: loadingId)
        
        return DataSource(
            collectionView: _collectionView) { collectionView, indexPath, item in
                if let item = item as? SearchItemSuccess {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: successId, for: indexPath) as? SearchCollectionViewCell
                    cell?.setViewModel(item.viewModel)
                    return cell
                }
                if let _ = item as? SearchItemLoading {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loadingId, for: indexPath) as? SearchLoadingCollectionViewCell
                    return cell
                }
                
                return nil
            }
    }
    
    private func _setupLayout() {
        _collectionView.collectionViewLayout =  UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let size = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: sectionIndex == 0 ? .absolute(130) : .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            return section
        })
    }
    
    func applySnapshot(sections: [SearchSection]) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        _dataSource.apply(snapshot)
    }
}
