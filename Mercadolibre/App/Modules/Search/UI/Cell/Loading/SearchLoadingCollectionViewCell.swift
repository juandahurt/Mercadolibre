//
//  SearchLoadingCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import NVActivityIndicatorView
import UIKit

class SearchLoadingCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _loaderView: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _setup()
    }
    
    private func _setup() {
        _loaderView.startAnimating()
    }
}
