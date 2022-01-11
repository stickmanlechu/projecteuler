// It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
//
// Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

import Foundation

extension Int {
    var digits: [Int] {
        var d = self
        var res = [Int]()
        while d != 0 {
            res.append(d % 10)
            d /= 10
        }
        return res
    }
}

let start = CFAbsoluteTimeGetCurrent()

for i in 100001...166666 where i % 5 != 0 {
    let d = Set(i.digits)
    let products = [2, 3, 4, 5, 6].map { Set((i * $0).digits) }
    if products.allSatisfy({ $0 == d }) {
        print(i)
    }
}

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
