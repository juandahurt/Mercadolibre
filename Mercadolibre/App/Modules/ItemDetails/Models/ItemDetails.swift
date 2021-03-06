//
//  ItemDetails.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation

struct ItemDetails: Decodable {
    var id: String
    var title: String
    var condition: ItemCondition
    var soldQuantity: Int
    var pictures: [ItemPicture]
    var price: Double
    var originalPrice: Double?
    var permalink: String
    
    enum ContainerCodingKeys: CodingKey {
        case body
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition, pictures, price, permalink
        case soldQuantity = "sold_quantity"
        case originalPrice = "original_price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .body)
        
        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        condition = try dataContainer.decode(ItemCondition.self, forKey: .condition)
        pictures = try dataContainer.decode([ItemPicture].self, forKey: .pictures)
        soldQuantity = try dataContainer.decode(Int.self, forKey: .soldQuantity)
        price = try dataContainer.decode(Double.self, forKey: .price)
        originalPrice = try dataContainer.decodeIfPresent(Double.self, forKey: .originalPrice)
        permalink = try dataContainer.decode(String.self, forKey: .permalink)
    }
    
    init(id: String, title: String, condition: ItemCondition, pictures: [ItemPicture], soldQuantity: Int, price: Double, originalPrice: Double?, permalink: String) {
        self.id = id
        self.title = title
        self.condition = condition
        self.pictures = pictures
        self.soldQuantity = soldQuantity
        self.price = price
        self.originalPrice = originalPrice
        self.permalink = permalink
    }
}

enum ItemCondition: String, Decodable {
    case new = "new"
}

struct ItemPicture: Decodable {
    let url: String
}
