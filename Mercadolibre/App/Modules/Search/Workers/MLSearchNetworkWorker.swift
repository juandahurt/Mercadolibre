//
//  MLSearchNetworkWorker.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation
import RxSwift

protocol MLSearchWorker {
    func fetchItems(from query: String, offset: Int, limit: Int) -> Single<([Item], ItemPaging)>
}

class MLSearchNetworkWorker: MLSearchWorker {
    func fetchItems(from query: String, offset: Int, limit: Int) -> Single<([Item], ItemPaging)> {
        MLLogger.instance.log("worker: searching query: '\(query)'", level: .debug)
        
        return Single.create { single in
            let disposable = Disposables.create()
            
            let manager: NetworkManager
            do {
                manager = try NetworkManager.sharedInstance()
            } catch {
                single(.failure(error))
                return disposable
            }
            
            manager.request(path: ApiService.search, params: ["q": query, "offset": "\(offset)", "limit": "\(limit)"]) { data, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(SearchResult.self, from: data)
                        single(.success((result.results, result.paging)))
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
