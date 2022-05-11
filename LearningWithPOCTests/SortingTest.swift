//
//  SortingTest.swift
//  InterviewPreparationTests
//
//  Created by Dipakbhai Valjibhai Makwana on 09/05/22.
//

import XCTest
@testable import InterviewPreparation


class SortingTest: XCTestCase {

    func test_Sorting(){
        let sorting = Sorting()
        let result = sorting.sortArr(arr: [1,4,55,2,3])
        XCTAssertEqual([1,2,3,4,55], result)
    }
    func test_SortingMinusValue(){
        let sorting = Sorting()
        let result = sorting.sortArr(arr: [1,-4,55,2,-3])
        XCTAssertEqual([-4,-3,1,2,55], result)
    }
    func test_SortingWithZeroValue(){
        let sorting = Sorting()
        let result = sorting.sortArr(arr: [1,-4,55,2,-3,0])
        XCTAssertEqual([-4,-3,0,1,2,55], result)
    }
    func test_SortingWithFloatValue(){
        let sorting = Sorting()
        let result = sorting.sortArr(arr: [-4,55,2.9,2.2,-3,])
        XCTAssertEqual([-4,-3,2.2,2.9,55], result)
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func test_QuickSortAlgoritham(){
        let sorting = Sorting()
        let result = sorting.quickSort(arr: [1,4,55,2,3])
        XCTAssertEqual([1,2,3,4,55], result)
    }
    func test_QuickSortAlgorithamCase1(){
        let sorting = Sorting()
        let result = sorting.quickSort(arr: [1,4,55,4,1,2,3])
        XCTAssertEqual([1,1,2,3,4,4,55], result)
    }
    func test_QuickSortingMinusValue(){
        let sorting = Sorting()
        let result = sorting.quickSort(arr: [1,-4,55,2,-3])
        XCTAssertEqual([-4,-3,1,2,55], result)
    }
    func test_QuickSortingWithZeroValue(){
        let sorting = Sorting()
        let result = sorting.quickSort(arr: [1,-4,55,2,-3,0])
        XCTAssertEqual([-4,-3,0,1,2,55], result)
    }
    func test_QuickSortingWithFloatValue(){
        let sorting = Sorting()
        let result = sorting.quickSort(arr: [-4,55,2.9,2.2,-3,])
        XCTAssertEqual([-4,-3,2.2,2.9,55], result)
    }
    
}
