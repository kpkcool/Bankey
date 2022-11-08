//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by K Praveen Kumar on 08/11/22.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase{
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        //This test gets called once per test
        formatter = CurrencyFormatter()
    }
    
    func testShouldBeVisible() throws {
    }
}
