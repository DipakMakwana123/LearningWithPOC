//
//  DSAViewController.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 06/05/22.
//

import UIKit

class DSAViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 11)
        //findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 16)
        // let result = findIndexFromArray(arr:[3,4,-5,6,7,9],targetVal: -1)
        let result = findIndexFromArray(arr:[3,4,-5,6,7,9],targetVal: 3)
        debugPrint(result)
        if result.isEmpty {
            debugPrint("Something is wrong")
        }
        let _ = generateFibonaciiSeries(num: 9)
        let _ = binarySearch(arr: [2,4,6,5,7,1,8,9,11,12], searchVal: 5)
        
    }
    
    /*
     
     Find the corresponding indexs from array where Sum of index's value should be target numnber.
     
     Input : [3,4,5,6,7,9]
     
     Target Value = 11
     
     OutPut: [2,3]
     
     */
    func findIndexFromArray(arr:[Int], targetVal:Int) -> [Int]{
        let  indexArr:[Int] = []
        guard !arr.isEmpty else {return indexArr}
        debugPrint(arr.count)
        for (index,num) in arr.enumerated() {
            let val1 = arr[index]
            if index + 1 < arr.count {
                let val2 = arr[safe:index + 1]
                debugPrint(index+1, num)
                if let val2 = val2 , val1 + val2 == targetVal {
                    return   [index,index+1]
                }
            }
        }
        
        return []
    }
    
    private func sortedArr(arr:inout [Int]){
        var maxValue = 0
        // var resultArr = arr
        for (_,num) in arr.enumerated() {
            //maxValue = num
            if num > maxValue {
                maxValue = num
            }
        }
    }
    
    private func binarySearch(arr:[Int],searchVal:Int){
        
    }
    
    func generateFibonaciiSeries(num:Int){
        var fiboArr: [Int] = [Int]()
        var val1 = 0
        var total = 1
        
        for _ in 0...num {
            fiboArr.append(total)
            let temp = val1
            val1 = total
            total = temp + val1
        }
        debugPrint(fiboArr)
    }
}


enum MathError : Error {
    case divideByZero
}

class DivideTwoNumber {
    
    /*
     func divide(dividend: Int, divisor: Int) throws -> Int  {
     
     if(dividend == 0){
     return 0
     }
     
     if(divisor == 0){
     throw MathError.divideByZero
     }
     
     let isNegative = (dividend < 0) || (divisor < 0)
     var quotient = 0
     var tempDivident = convertToPositiveInteger(value: dividend)
     let tempDivisor = convertToPositiveInteger(value: divisor)
     
     while tempDivident >= tempDivisor {
     tempDivident = tempDivident - tempDivisor
     quotient = quotient + 1
     }
     
     if(isDividentAndDivisorBothNegative(dividend: dividend, divisor: divisor)){
     return quotient
     }
     
     return isNegative ? -quotient : quotient
     }
     */
    
    
    func divide(dividend: Int, divisor: Int) throws -> Int  {
        
        if(dividend == 0){
            return 0
        }
        
        if(divisor == 0){
            throw MathError.divideByZero
        }
        
        let isNegative = (dividend < 0) || (divisor < 0)
        var quotient = 0
        var tempDivident = abs(dividend)//convertToPositiveInteger(value: dividend)
        let tempDivisor = abs(divisor)//convertToPositiveInteger(value: divisor)
        
        while tempDivident >= tempDivisor {
            tempDivident = tempDivident - tempDivisor
            quotient = quotient + 1
        }
        
        if(isDividentAndDivisorBothNegative(dividend: dividend, divisor: divisor)){
            return quotient
        }
        
        return isNegative ? -quotient : quotient
    }
    
    private func convertToPositiveInteger(value: Int) -> Int {
        return value < 0 ? value * -1 : value
    }
    
    private func isDividentAndDivisorBothNegative(dividend: Int, divisor: Int) -> Bool{
        return (dividend < 0) && (divisor < 0)
    }
}

class Sorting {
    
    func quickSort<T:Comparable>(arr:[T]) -> [T] {
        
        var lessThanArr = [T]()
        var greaterThanArr = [T]()
        var equalArr = [T]()
        //var pivot = 0
        
        if arr.count > 1 {
            let pivot = arr[arr.count/2]
            for num in arr  {
                 if num > pivot {
                    greaterThanArr.append(num)
                }
                else if num < pivot {
                    lessThanArr.append(num)
                }
                else {
                    equalArr.append(num)
                }
                
            }
            return quickSort(arr: lessThanArr) + equalArr + quickSort(arr: greaterThanArr)
        }
        
       
        
        return arr
    }
    
    func sortArr<T:Comparable>(arr:[T]) -> [T] {
        var tempArr = arr
        var resultArr = [T]()
        while resultArr.count != arr.count {
            resultArr = findMinValue(arr: &tempArr, resultArr: &resultArr)
        }
        return resultArr
    }
    private func findMinValue<T:
                                    Comparable>(arr:inout[T],resultArr: inout[T]) -> [T]{
        if arr.isEmpty {
            return []
        }
        var minVal = arr[0]
        var minNumberIndex = 0
        for (index,num) in arr.enumerated() {
            if num < minVal {
                minNumberIndex = index
                minVal = num
            }
        }
        resultArr.append(minVal)
        if arr.count > minNumberIndex {
            arr.remove(at: minNumberIndex)
        }
        debugPrint(resultArr)
        return resultArr
    }
}
class SearchAlgoritham {
    
    func binarySearch<T:Comparable>(arr: [T],searchVal:T) -> Bool {
        
        guard !arr.isEmpty else {return false}
        var midIndex = 0
        let sortingClass = Sorting()
        let resultArr = sortingClass.sortArr(arr: arr)
        midIndex = resultArr.count / 2
        var isAvailable = checkValue(arr: resultArr, endIndex: midIndex, searchVal: searchVal)
        if !isAvailable {
            isAvailable = checkValue(arr: resultArr, endIndex: resultArr.count - 1, searchVal: searchVal)
            return isAvailable
        }
        else {
            return isAvailable
        }
    }
    private func checkValue<T:Comparable>(arr:[T],endIndex:Int,searchVal:T) -> Bool{
        for ind in 0...endIndex {
            if arr[ind] == searchVal {
                return true
            }
        }
        return false
    }
    
    func findValueFromMatrix(matrix:[[Int]],searchValue:Int) -> Bool{
        
        for subArr in matrix {
            for num in subArr {
                if num == searchValue {
                    return true 
                }
            }
        }
        return false
    }
}

class Algoritham {
    
    func secondLargestNumber(arr:[Int]) -> Int{
        guard  !arr.isEmpty else {return -1}
        var largestNum = 0
        var secondLargest = 0
        
        for num in arr {
            if num > largestNum {
                secondLargest = largestNum
                largestNum = num
            }else if num > secondLargest {
                secondLargest = num
            }
        }
        return secondLargest
    }
    func secondLargestNumberFromString(str:String) -> Int{
        
        var numberArr:[Int] = [Int]()
        for char in str {
            if char.isNumber , let number = Int(String(char)) {
                numberArr.append(number)
            }
        }
        return secondLargestNumber(arr: numberArr)
    }
    
    func checkStringWeatherItHasPairBrackets(str:String) -> Bool{
        var stackArray = [String]()
        
        let  validBrackets = ["{":"}","[":"]","(":")"]
        for char in str {
            if validBrackets.keys.contains(String(char)){
                stackArray.append(String(char))
            }
            else if  validBrackets.values.contains(String(char)){
                debugPrint(validBrackets[stackArray.last ?? ""] ?? "")
                if let lastChar = validBrackets[stackArray.last ?? ""],  lastChar == String(char) {
                    stackArray.removeLast()
                }
            }
            debugPrint(stackArray)
        }
        return stackArray.isEmpty ? true : false
    }
}
class Sum {
    
    func findPairSum(arr:[Int],sum:Int) -> [[Int]]{
        var resultArr = [[Int]]()
        for (iIndex,num) in arr.enumerated() {
            
            for jIndex in iIndex+1..<arr.count {
                if let nextValue = arr[safe:jIndex] {
                    if sum == num + nextValue {
                        resultArr.append([num,nextValue])
                    }
                }
            }
            debugPrint(resultArr)
        }
        
        return resultArr
    }
}

class Palindrom {
    
    
    func checkNumberIsPalindom(number:Int) ->Bool{
        
        var reminder = 0
        var originalNumber = number
        var reversedNumber = 0
        
        while originalNumber > 0 {
            reminder = originalNumber % 10
            reversedNumber = reversedNumber * 10 + reminder
            originalNumber = originalNumber/10
        }
        return reversedNumber == number ? true : false
    }
    
    func checkStringIsPalindom(str:String) ->Bool{
        var reversedString = ""
        for char in str.reversed(){
            reversedString.append(String(char))
        }
        debugPrint(reversedString.capitalized)
        return reversedString.capitalized == str ? true : false
    }

}
