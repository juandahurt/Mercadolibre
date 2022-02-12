//
//  NetworkManager.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

class NetworkManager {
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func request(method: NetworkMethod = .get, endpoint: String = "", params: [String: Any]? = nil, completion: @escaping (Data?, Error?) -> Void) {
        guard let _ = URL(string: baseUrl + endpoint) else {
            completion(nil, NetworkError.malformedUrl)
            return
        }
    }
}
