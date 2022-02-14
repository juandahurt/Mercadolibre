//
//  NetworkTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 12/02/22.
//

import XCTest
@testable import Mercadolibre

class NetworkTests: XCTestCase {
    func test_malformed_url() {
        let sut = NetworkManager(baseUrl: "wrong url!")
        sut.request { _, error in
            if let error = error as? NetworkError {
                XCTAssert(error.localizedDescription == NetworkError.malformedUrl.localizedDescription)
            } else {
                XCTFail("Wrong error thrown!")
            }
        }
    }
    
    func test_base_url_not_provided() {
        do {
            _ = try NetworkManager.sharedInstance()
        } catch NetworkError.baseUrlNotProvided {
            
        } catch {
            XCTFail("Wrong error thrown!")
        }
    }
    
    func test_base_url_provided() {
        NetworkManager.provideBaseUrl("")
        do {
            _ = try NetworkManager.sharedInstance()
        } catch {
            XCTFail("Should not throw!")
        }
    }
}
