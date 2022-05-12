//
//  PalindromTest.swift
//  LearningWithPOCTests
//
//  Created by Dipakbhai Valjibhai Makwana on 12/05/22.
//

import XCTest
@testable import LearningWithPOC

class PalindromTest: XCTestCase {

    let obj = Palindrom()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_numberIsPalindrom_Case1(){
        let result = obj.checkNumberIsPalindom(number: 121)
        XCTAssertEqual(result, true)
    }
    func test_numberIsPalindrom_Case2(){
         let result = obj.checkNumberIsPalindom(number: 1211)
        XCTAssertEqual(result, false)
    }
    func test_numberIsPalindrom_Case3(){
        
        let result = obj.checkNumberIsPalindom(number: -121)
        XCTAssertEqual(result, false)
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////
    func test_stringIsPalindrom_Case1(){
         let result = obj.checkStringIsPalindom(str: "madam")
        XCTAssertEqual(result, true)
    }
    func test_stringIsPalindrom_Case2(){
         let result = obj.checkStringIsPalindom(str: "Madam")
        XCTAssertEqual(result, true)
    }
    func test_stringIsPalindrom_Case3(){
         let result = obj.checkStringIsPalindom(str: "racecar")
        XCTAssertEqual(result, true)
    }
    func test_stringIsPalindrom_Case4(){
         let result = obj.checkStringIsPalindom(str: "02-02-2020")
        XCTAssertEqual(result, true)
    }
    func test_stringIsPalindrom_Case5(){
         let result = obj.checkStringIsPalindom(str: "02-02-20-20")
        XCTAssertEqual(result, true)
    }
}
