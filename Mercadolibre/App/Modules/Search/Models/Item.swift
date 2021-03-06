//
//  Item.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

struct Item: Decodable {
    var id: String
    var title: String
    var thumbnail: String
    var price: Double
    var originalPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, price
        case originalPrice = "original_price"
    }
}
