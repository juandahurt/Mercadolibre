//
//  ItemDetailsPhotoCollectionViewCell.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import UIKit

class ItemDetailsPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _imageView: UIImageView!
    
    func setViewModel(_ viewModel: MLItemDetailsPictureViewModel) {
        if let url = URL(string: viewModel.picture.url) {
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        
                        self._imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
