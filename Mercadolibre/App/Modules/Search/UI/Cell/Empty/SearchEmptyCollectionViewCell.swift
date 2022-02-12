//
//  SearchEmptyCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import UIKit

class SearchEmptyCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _imageContainerView: UIView!
    @IBOutlet private weak var _titleLabel: UILabel!
    @IBOutlet private weak var _subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _setup()
    }
    
    private func _setup() {
        _imageContainerView.layer.cornerRadius = _imageContainerView.frame.width / 2
        _titleLabel.text = "No encontramos publicaciones"
        _subtitleLabel.text = "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales."
    }
}
