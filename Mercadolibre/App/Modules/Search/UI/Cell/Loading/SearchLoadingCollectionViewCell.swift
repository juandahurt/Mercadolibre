//
//  SearchLoadingCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import NVActivityIndicatorView
import UIKit

class SearchLoadingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        indicatorView.color = .systemBlue
        indicatorView.startAnimating()
    }
}
