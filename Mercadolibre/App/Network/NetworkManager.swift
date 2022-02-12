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
    
    func request(method: NetworkMethod = .get, path: String = "", params: [String: Any]? = nil, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: baseUrl + path) else {
            completion(nil, NetworkError.malformedUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let params = params {
            var components = URLComponents()
            var items = [URLQueryItem]()
            
            for (key, value) in params {
                let item = URLQueryItem(name: key, value: "\(value)")
                items.append(item)
            }
            components.queryItems = items
            request.url = URL(string: request.url!.absoluteString + components.url!.absoluteString)
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                MLLogger.instance.log("network manager: unknown error: \(error.localizedDescription)", level: .debug)
                return
            }
            
            if let data = data {
                completion(data, nil)
                return
            }
        }.resume()
    }
}
