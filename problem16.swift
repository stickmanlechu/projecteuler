//2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
//
//What is the sum of the digits of the number 2^1000?

import Foundation

func multiply(_ bigNumber: [Int], by number: Int) -> [Int] {
    var carry = 0
    var result = [Int]()
    for int in bigNumber.reversed() {
        let totalResult = number * int + carry
        carry = totalResult / 10
        result.append(totalResult % 10)
    }
    while carry > 0 && carry % 10 != 0 {
        result.append(carry % 10)
        carry /= 10
    }
    return result.reversed()
}

let start = CFAbsoluteTimeGetCurrent()

var bigNumber = [1]
for _ in 1...1000 {
    bigNumber = multiply(bigNumber, by: 2)
}
print(bigNumber.reduce(0, +))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

