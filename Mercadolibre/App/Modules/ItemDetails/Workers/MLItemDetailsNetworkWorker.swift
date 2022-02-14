//
//  MLItemDetailsNetworkWorker.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import RxSwift

protocol MLItemDetailsWorker {
    func fetchDetails(id: String) -> Single<ItemDetails>
}

class MLItemDetailsNetworkWorker: MLItemDetailsWorker {
    deinit {
        MLLogger.instance.log("details network worker is being deallocated", level: .deallocation)
    }
    
    func fetchDetails(id: String) -> Single<ItemDetails> {
        Single.create { single in
            let disposable = Disposables.create()
            
            let manager: NetworkManager
            
            do {
                manager = try NetworkManager.sharedInstance()
            } catch {
                single(.failure(error))
                return disposable
            }
            
            manager.request(path: ApiService.details, params: ["ids": id]) { data, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let items = try decoder.decode([ItemDetails].self, from: data)
                        single(.success(items[0]))
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
