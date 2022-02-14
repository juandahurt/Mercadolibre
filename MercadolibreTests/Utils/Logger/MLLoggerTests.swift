//
//  MLLoggerTests.swift
//  MercadolibreTests
//
//  Created by Juan Hurtado on 11/02/22.
//

import XCTest
@testable import Mercadolibre

class MLLoggerTests: XCTestCase {
    func test_log_modification() {
        let sut = MockModifier()
        let logHi = "hello!"
        let logBye = "bye!"
        
        let modifiedHiLog = sut.modify(logHi, level: .debug)
        let modifiedByeLog = sut.modify(logBye, level: .debug)
        
        XCTAssertEqual(modifiedHiLog, "modified hello!")
        XCTAssertEqual(modifiedByeLog, "modified bye!")
    }
}

// MARK: - Helpers
private class MockModifier: MLLogModifier {
    func modify(_ text: String, level: MLLogLevel) -> String {
        "modified \(text)"
    }
}
