//
//  MLSearchNetworkWorker.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation
import RxSwift

protocol MLSearchWorker {
    func fetchItems(from query: String) -> Single<[Item]>
}

class MLSearchNetworkWorker: MLSearchWorker {
    func fetchItems(from query: String) -> Single<[Item]> {
        MLLogger.instance.log("Searching query: '\(query)'", level: .debug)
        return Single.just([])
    }
}
