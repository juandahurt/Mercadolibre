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
        let manager = NetworkManager(baseUrl: "wrong url!")
        manager.request { _, error in
            if let error = error as? NetworkError {
                XCTAssert(error == .malformedUrl)
            } else {
                XCTFail("Wrong error thrown!")
            }
        }
    }
}
