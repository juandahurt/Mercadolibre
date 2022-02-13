//
//  SearchCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!

    func setViewModel(_ viewModel: SearchViewModel) {
        titleLabel.text = viewModel.item.title
        priceLabel.text = viewModel.getFormattedPrice()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            if let url = URL(string: viewModel.item.thumbnail) {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
