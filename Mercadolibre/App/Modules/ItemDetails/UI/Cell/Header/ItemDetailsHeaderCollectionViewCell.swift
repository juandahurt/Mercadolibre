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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _setup()
    }
    
    private func _setup(){
        _titleLabel.font = AppStyle.Font.get(.regular, size: .title)
        _conditionLabel.font = AppStyle.Font.get(.regular, size: .body)
    }
    
    func setViewModel(_ viewModel: MLItemDetailsViewModel) {
        _titleLabel.text = viewModel.details.title
        _conditionLabel.text = viewModel.conditionText
    }
}
