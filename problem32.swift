// We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
//
// The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
//
// Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
//
// HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

import Foundation

extension RandomAccessCollection where Element == Int, Index == Int {
    func asInt() -> Int {
        indices.reduce(0) { $0 + self[$1] * pwr(10, count - $1 - 1) }
    }
}

func pwr(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? 1 : (1...y).reduce(1) { r, _ in r * x }
}

func permute(_ array: [Int]) -> [[Int]] {
    guard array.count > 1 else {
        return [[array.first!]]
    }
    return array.indices.reduce(into: [[Int]]()) { partialResult, index in
        var newArray = array
        let element = newArray.remove(at: index)
        partialResult.append(contentsOf: permute(newArray).map {
            [element] + $0
        })
    }
}

func check(array: [Int], index: Int) -> Int? {
    let num1 = Array(array[0...index]).asInt()
    let num2 = Array(array[(index + 1)...4]).asInt()
    let num3 = Array(array[5...8]).asInt()
    return num1 * num2 == num3 ? num3 : nil
}

func findPandigital() -> [Int] {
    permute(Array(1...9))
        .flatMap { permutation in
            [0, 1].compactMap { check(array: permutation, index: $0) }
        }
}

let start = CFAbsoluteTimeGetCurrent()

print(Set(findPandigital()).reduce(0, +))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
