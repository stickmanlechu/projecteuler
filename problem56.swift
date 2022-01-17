// https://projecteuler.net/problem=56

import Foundation

func mul(_ bigNumber: [Int], by number: Int) -> [Int] {
    var carry = 0
    var result = [Int]()
    for int in bigNumber.reversed() {
        let totalResult = number * int + carry
        carry = totalResult / 10
        result.append(totalResult % 10)
    }
    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }
    return result.reversed()
}

func pow(_ a: Int, _ b: Int) -> [Int] {
    var res = [1]
    for _ in 1...b {
        res = mul(res, by: a)
    }
    return res
}

extension Int {
    var digits: [Int] {
        var asArray = [Int]()
        var n = self
        while n != 0 {
            asArray.insert(n % 10, at: 0)
            n /= 10
        }
        return asArray
    }
}

let start = CFAbsoluteTimeGetCurrent()

var maxSum = 0
var ab = (0, 0)
for a in 10...99 {
    for b in 1...99 {
        let sum = pow(a, b).reduce(0, +)
        guard sum > maxSum else { continue }
        maxSum = sum
        ab = (a, b)
    }
}
print(ab)
print(maxSum)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
