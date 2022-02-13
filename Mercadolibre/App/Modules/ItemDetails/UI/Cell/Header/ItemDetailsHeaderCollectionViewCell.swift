//
//  ItemDetailsHeaderCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class ItemDetailsHeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var _conditionLabel: UILabel!
    @IBOutlet weak var _titleLabel: UILabel!
    
    func setViewModel(_ viewModel: MLItemDetailsViewModel) {
        _titleLabel.text = viewModel.details.title
        _conditionLabel.text = viewModel.condition
    }
}
