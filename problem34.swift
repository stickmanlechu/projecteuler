// 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
//
// Find the sum of all numbers which are equal to the sum of the factorial of their digits.

import Foundation

extension Int {
    var digits: [Int] {
        var d = self
        var res = [Int]()
        while d != 0 {
            res.append(d % 10)
            d /= 10
        }
        return res.reversed()
    }
}

extension RandomAccessCollection where Element == Int, Index == Int {
    func asInt() -> Int {
        indices.reduce(0) { $0 + self[$1] * pwr(10, count - $1 - 1) }
    }
}

func pwr(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? 1 : (1...y).reduce(1) { r, _ in r * x }
}

let factorials = (1...9).reduce(into: [1]) { $0.append($0.last! * $1) }

func upperBound() -> Int {
    var i = 1
    while i * factorials[9] > Array<Int>(repeating: 9, count: i).asInt() {
        i += 1
    }
    return Array<Int>(repeating: 9, count: i).asInt()
}

func findCurious() -> Int {
    var found = Set<Int>()
    for n in 10...upperBound() {
        guard n == n.digits.map({ factorials[$0] }).reduce(0, +) else { continue }
        print(n)
        found.insert(n)
    }
    return found.reduce(0, +)
}

let start = CFAbsoluteTimeGetCurrent()

print(findCurious())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
