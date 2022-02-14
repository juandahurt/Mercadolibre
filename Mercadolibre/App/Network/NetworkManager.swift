//
//  NetworkManager.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 12/02/22.
//

import Foundation

class NetworkManager {
    private let _baseUrl: String
    private static var _instance: NetworkManager?
    
    init(baseUrl: String) {
        self._baseUrl = baseUrl
    }
    
    static func provideBaseUrl(_ baseUrl: String) {
        _instance = NetworkManager(baseUrl: baseUrl)
    }
    
    static func sharedInstance() throws -> NetworkManager {
        if _instance != nil {
            return _instance!
        } else {
            throw NetworkError.baseUrlNotProvided
        }
    }
    
    func request(method: NetworkMethod = .get, path: String = "", params: [String: Any]? = nil, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: _baseUrl + path) else {
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
            
            if let response = response as? HTTPURLResponse {
                if !(200..<300).contains(response.statusCode) {
                    MLLogger.instance.log("network manager: status code error has occured!", level: .debug)
                    completion(nil, NetworkError.statusCode(response.statusCode ))
                    return
                }
            }
            
            if let data = data {
                completion(data, nil)
                return
            }
        }.resume()
    }
}
