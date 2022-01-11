//The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
//
//Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
//
//d2d3d4=406 is divisible by 2
//d3d4d5=063 is divisible by 3
//d4d5d6=635 is divisible by 5
//d5d6d7=357 is divisible by 7
//d6d7d8=572 is divisible by 11
//d7d8d9=728 is divisible by 13
//d8d9d10=289 is divisible by 17
//Find the sum of all 0 to 9 pandigital numbers with this property.

import Foundation

extension RandomAccessCollection where Element == Int, Index == Int {
    func asInt() -> Int {
        indices.reduce(0) { $0 + self[$1] * pwr(10, count - $1 - 1) }
    }
    
    func check() -> Bool {
        guard self[3] % 2 == 0 else {
            return false
        }
        guard Array(self[2...4]).asInt() % 3 == 0 else {
            return false
        }
        guard Array(self[4...6]).asInt() % 7 == 0 else {
            return false
        }
        guard Array(self[5...7]).asInt() % 11 == 0 else {
            return false
        }
        guard Array(self[6...8]).asInt() % 13 == 0 else {
            return false
        }
        guard Array(self[7...9]).asInt() % 17 == 0 else {
            return false
        }
        return true
    }
}

func pwr(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? 1 : (1...y).reduce(1) { r, _ in r * x }
}

func permute(_ array: [Int], pos: Int = 0) -> [[Int]] {
    guard array.count > 1 else {
        return [[array.first!]]
    }
    guard pos != 5 else {
        return permute(array, pos: pos + 1).map { [5] + $0 }
    }
    return array.indices.filter({ !(pos == 0 && array[$0] == 0) }).reduce(into: [[Int]]()) { partialResult, index in
        var newArray = array
        let element = newArray.remove(at: index)
        if pos == 0 && element == 0 { return }
        partialResult.append(contentsOf: permute(newArray, pos: pos + 1).map {
            [element] + $0
        })
    }
}

let start = CFAbsoluteTimeGetCurrent()

print(permute([0, 1, 2, 3, 4, 6, 7, 8, 9]).filter { $0.check() }.map { $0.asInt() }.reduce(0, +))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
