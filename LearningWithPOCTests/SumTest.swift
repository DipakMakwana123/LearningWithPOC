//
//  SumTest.swift
//  LearningWithPOCTests
//
//  Created by Dipakbhai Valjibhai Makwana on 11/05/22.
//

import XCTest
@testable import LearningWithPOC

class SumTest: XCTestCase {
 
    func test_sum_Case1() {
        let obj = Sum()
        let result = obj.findPairSum(arr: [1,2,3,4,5,0,4], sum: 5)
        XCTAssertEqual(result, [[1,4],[1,4],[2,3],[5,0]])
    }
    func test_sum_Case2() {
        let obj = Sum()
        let result = obj.findPairSum(arr: [1,2,3,4,5,0,4], sum: 12)
        XCTAssertNotEqual(result, [[1,4],[1,4],[2,3],[5,0]])
    }
    func test_sum_Case3() {
        let obj = Sum()
        let result = obj.findPairSum(arr: [1,2,3,4,5,0,4], sum: 12)
        XCTAssertEqual(result, [])
    }
    func test_sum_Case4() {
        let obj = Sum()
        let result = obj.findPairSum(arr: [1,2,3,4,5,0,4], sum: 3)
        XCTAssertEqual(result, [[1,2],[3,0]])
    }
    func test_sum_Case5() {
        let obj = Sum()
        let result = obj.findPairSum(arr: [1,2,3,4,-5,0,4], sum: -1)
        XCTAssertEqual(result, [[4,-5],[-5,4]])
    }

}
