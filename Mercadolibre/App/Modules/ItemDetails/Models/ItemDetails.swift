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
    
    enum ContainerCodingKeys: CodingKey {
        case body
    }
    
    enum CodingKeys: CodingKey {
        case id, title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .body)
        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
    }
}
