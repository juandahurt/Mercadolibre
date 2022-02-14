//
//  SearchResult.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

struct SearchResult: Decodable {
    var results: [Item]
    var paging: ItemPaging
}

class ItemPaging: Decodable {
    let total: Int
    let results: Int
    let offset: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total, offset, limit
        case results = "primary_results"
    }
    
    init(total: Int, results: Int, offset: Int, limit: Int) {
        self.total = total
        self.results = results
        self.offset = offset
        self.limit = limit
    }
}
