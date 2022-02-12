//
//  SearchErrorCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import UIKit

class SearchErrorCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _imageContainerView: UIView!
    @IBOutlet private weak var _titleLabel: UILabel!
    @IBOutlet private weak var _descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _setup()
    }

    private func _setup() {
        _imageContainerView.layer.cornerRadius = _imageContainerView.frame.width / 2
        _titleLabel.text = "Lo sentimos."
        _descriptionLabel.text = "Parece que ha ocurrido un error. \nPor favor, intenta más tarde."
    }
}
