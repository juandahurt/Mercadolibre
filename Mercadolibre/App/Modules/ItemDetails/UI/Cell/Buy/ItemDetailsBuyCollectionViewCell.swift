//
//  ItemDetailsBuyCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class ItemDetailsBuyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var _buyButton: UIButton!
    @IBOutlet weak var _addToCartButton: UIButton!
    
    var buyOnTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _setup()
    }
    
    private func _setup() {
        _buyButton.layer.cornerRadius = 5
        _addToCartButton.layer.cornerRadius = 5
        
        _buyButton.setTitle("Comprar ahora", for: .normal)
        _addToCartButton.setTitle("Agregar al carrito", for: .normal)
        
        _buyButton.addTarget(self, action: #selector(_buyWasTapped), for: .touchUpInside)
    }
    
    @objc
    private func _buyWasTapped() {
        buyOnTap?()
    }
}
