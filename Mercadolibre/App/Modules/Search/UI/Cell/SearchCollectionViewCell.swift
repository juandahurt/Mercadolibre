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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func _setup() {
    }

    func setData(_ item: Item) {
        titleLabel.text = item.title
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            if let url = URL(string: item.thumbnail) {
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
