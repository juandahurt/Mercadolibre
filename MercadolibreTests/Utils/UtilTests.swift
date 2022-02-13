//
//  UtilTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 13/02/22.
//

import XCTest
@testable import Mercadolibre

class UtilTests: XCTestCase {
    func test_currency_formatter() {
        let formatted1 = Util.toCurrency(from: 1000)
        XCTAssertEqual(formatted1, "$1,000.00")
        
        let formatted2 = Util.toCurrency(from: 900)
        XCTAssertEqual(formatted2, "$900.00")
    }
}
