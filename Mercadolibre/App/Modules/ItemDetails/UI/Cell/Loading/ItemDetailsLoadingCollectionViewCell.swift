//
//  ItemDetailsLoadingCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 14/02/22.
//

import NVActivityIndicatorView
import UIKit

class ItemDetailsLoadingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var _loaderView: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        _setup()
    }
    
    private func _setup() {
        _loaderView.startAnimating()
    }
}
