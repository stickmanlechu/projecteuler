//We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
//
//What is the largest n-digit pandigital prime that exists?

import Foundation

extension Int {
    var isPrime: Bool {
        guard self != 0 else { return false }
        let upper = Int(sqrt(Double(abs(self))))
        guard upper > 2 else { return true }
        return (2...upper).first(where: { self % $0 == 0 }) == nil
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

let start = CFAbsoluteTimeGetCurrent()

var all = [Int]()
for upper in (1...9).reversed() {
    all.append(contentsOf: permute(Array(1...upper)).map { $0.asInt() })
}
print(all.sorted(by: >).first(where: { $0.isPrime })!)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
