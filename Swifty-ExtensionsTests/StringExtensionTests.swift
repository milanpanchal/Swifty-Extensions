//
//  StringExtensionTests.swift
//  Swifty-ExtensionsTests
//
//  Created by Milan Panchal on 21/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import XCTest
@testable import Swifty_Extensions

class StringExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testIni() {
        XCTAssertEqual("Milan".initialsByPersonNameComponents, "M", "Initials should be M")
        XCTAssertEqual("Milan Panchal".initialsByPersonNameComponents, "MP", "Initials should be MP")
        XCTAssertEqual("Milan     Panchal".initialsByPersonNameComponents, "MP", "Initials should be MP")
        XCTAssertEqual("John Fitzgerald Kennedy".initialsByPersonNameComponents, "JK", "Initials should be JK")
        XCTAssertEqual("Mr John Jacob Smith III".initialsByPersonNameComponents, "JS", "Initials should be JS")
    }
    
    func testInitial() {
        XCTAssertEqual("Milan".initials, "M", "Initials should be M")
        XCTAssertEqual("Milan Panchal".initials, "MP", "Initials should be MP")
        XCTAssertEqual("Milan     Panchal".initials, "MP", "Initials should be MP")
        XCTAssertEqual("John Fitzgerald Kennedy".initials, "JK", "Initials should be JK")
        XCTAssertEqual("Mr John Jacob Smith III".initials, "MI", "Initials should be JS")
    }
}
