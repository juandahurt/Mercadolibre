//
//  ItemDetailsPriceCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class ItemDetailsPriceCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _originalPriceLabel: UILabel!
    @IBOutlet private weak var _priceLabel: UILabel!
    @IBOutlet private weak var _discountLabel: UILabel!
    
    func setViewModel(_ viewModel: MLItemDetailsPriceViewModel) {
        if viewModel.hasDiscount {
            _discountLabel.text = viewModel.discount
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: viewModel.originalPrice)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            _originalPriceLabel.attributedText = attributeString
        } else {
            _originalPriceLabel.removeFromSuperview()
            _discountLabel.removeFromSuperview()
        }
        _priceLabel.text = viewModel.price
    }
}
