//
//  SearchTests.swift
//  InterviewPreparationTests
//
//  Created by Dipakbhai Valjibhai Makwana on 10/05/22.
//

import XCTest

@testable import InterviewPreparation


class SearchTests: XCTestCase {

    func test_SearchValue() {
        let obj = SearchAlgoritham()
        let result = obj.binarySearch(arr: [1,4,11,2,5], searchVal: 4)
        XCTAssertEqual(true, result)
    }
    func test_SearchValueWithMinusValue() {
        let obj = SearchAlgoritham()
        let result = obj.binarySearch(arr: [1,4,11,2,5,-3], searchVal: -3)
        XCTAssertEqual(true, result)
    }
    func test_SearchValueWhichNotInScope() {
        let obj = SearchAlgoritham()
        let result = obj.binarySearch(arr: [1,4,11,2,5,-3], searchVal: 0)
        XCTAssertEqual(false, result)
    }
    func test_SearchValueWithFloatValue() {
        let obj = SearchAlgoritham()
        let result = obj.binarySearch(arr: [1,4.4,11,2,5,-3], searchVal: 4.4)
        XCTAssertEqual(true, result)
    }
}
