//
//  AlgorithamTests.swift
//  LearningWithPOCTests
//
//  Created by Dipakbhai Valjibhai Makwana on 10/05/22.
//

import XCTest
@testable import LearningWithPOC

class AlgorithamTests: XCTestCase {

    func test_findSecondLargestNumber(){
        let obj = Algoritham()
        let result = obj.secondLargestNumber(arr: [1,55,333,555,4])
        XCTAssertEqual(result, 333)
    }
    func test_findSecondLargestNumberWithMinusValue(){
        let obj = Algoritham()
        let result = obj.secondLargestNumber(arr: [1,55,-333,555,4])
        XCTAssertEqual(result, 55)
    }
    func test_findSecondLargestNumberFromStringCase1(){
        let obj = Algoritham()
        let result = obj.secondLargestNumberFromString(str: "sd123hjjk98")
        XCTAssertEqual(result, 8)
    }
    func test_findSecondLargestNumberFromStringCase2(){
        let obj = Algoritham()
        let result = obj.secondLargestNumberFromString(str: "sd123hjjk978")
        XCTAssertEqual(result, 8)
    }
    func test_findSecondLargestNumberFromStringCase3(){
        let obj = Algoritham()
        let result = obj.secondLargestNumberFromString(str: "sd123hjjk928")
        XCTAssertEqual(result, 8)
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////

    
}

class ValidString: XCTestCase {
    
    func test_validBrackets_Case1(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "{}")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case2(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case3(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "()")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case4(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "({(}}}")
        XCTAssertEqual(result, false)
    }
    func test_validBrackets_Case5(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "(")
        XCTAssertEqual(result, false)
    }
    func test_validBrackets_Case6(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "({})")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case7(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "({[]})")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case8(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "{([])}")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case9(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[{()}]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case10(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[{(12)}]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case11(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[{(123)}]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case12(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[{(123)}123]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case13(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[{(123)}123]")
        XCTAssertEqual(result, true)
    }
    func test_validBrackets_Case14(){
        let obj = Algoritham()
        let result = obj.checkStringWeatherItHasPairBrackets(str: "[1{2(3)}4]5")
        XCTAssertEqual(result, true)
    }
}
