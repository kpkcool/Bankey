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
    
    func testBreakDollarsIntoCents(){
        let result = formatter.breakIntoDollarsAndCents(926587.23)
        XCTAssertEqual(result.0, "926,587")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws{
        let result = formatter.dollarsFormatted(926587.23)
        XCTAssertEqual(result, "$926,587.23")
    }
    
    func testZeroDollarsFormatted() throws{
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
    
    func testDollarsFormattedWithCurrencySymbol() throws{
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(926587.23)
        print("\(currencySymbol)")
        XCTAssertEqual(result, "\(currencySymbol)926,587.23")
    }

}
