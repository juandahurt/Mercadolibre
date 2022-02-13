//
//  SearchCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _titleLabel: UILabel!
    @IBOutlet private weak var _imageView: UIImageView!
    @IBOutlet private weak var _priceLabel: UILabel!
    @IBOutlet private weak var _discountLabel: UILabel!
    
    func setViewModel(_ viewModel: MLSearchViewModel) {
        _titleLabel.text = viewModel.item.title
        _priceLabel.text = viewModel.getFormattedPrice()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            if let url = URL(string: viewModel.item.thumbnail) {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self._imageView.image = image
                    }
                }
            }
        }
    
        if viewModel.hasDiscount {
            _discountLabel.text = viewModel.discount
        } else {
            _discountLabel.isHidden = true
        }
    }
}
