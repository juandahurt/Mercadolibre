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
        MLLogger.instance.log("worker: searching query: '\(query)'", level: .debug)
        
        return Single.create { single in
            let disposable = Disposables.create()
            
            let manager = NetworkManager(baseUrl: ApiService.baseUrl)
            manager.request(path: ApiService.search, params: ["q": query]) { data, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(SearchResult.self, from: data)
                        single(.success(result.results))
                    } catch {
                        MLLogger.instance.log("worker error: \(error.localizedDescription)", level: .debug)
                        single(.failure(error))
                    }
                    return
                }
            }
            
            return disposable
        }
    }
}
