// Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
//
// 1634 = 1^4 + 6^4 + 3^4 + 4^4
// 8208 = 8^4 + 2^4 + 0^4 + 8^4
// 9474 = 9^4 + 4^4 + 7^4 + 4^4
// As 1 = 1^4 is not a sum it is not included.
//
// The sum of these numbers is 1634 + 8208 + 9474 = 19316.
//
// Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

import Foundation

func pwr(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? 1 : (1...y).reduce(1) { r, _ in r * x }
}

func solve(for n: Int = 4, maxInts: Int = 5) -> Int {
    let powers = (0...9).map { pwr($0, n) }
    let numArrays = (1...maxInts).reduce(into: Set<[Int]>([[]])) { partialResult, i in
        partialResult.formUnion(partialResult.flatMap { array in
            ((array.isEmpty ? 1 : 0)...9).map { array + [$0] }
        })
    }
    return numArrays
        .filter { !$0.isEmpty && $0 != [1] }
        .reduce(0) { partialResult, numArray in
            let num = numArray.indices.reduce(0) { $0 + numArray[$1] * pwr(10, numArray.count - $1 - 1) }
            let powersSum = numArray.reduce(0) { $0 + powers[$1] }
            guard num == powersSum else { return partialResult }
            return partialResult + num
        }
}

let start = CFAbsoluteTimeGetCurrent()

print(solve(for: 5, maxInts: 6))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
