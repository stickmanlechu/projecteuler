// Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
// If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
//
// For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
//
// Evaluate the sum of all the amicable numbers under 10000.

import Foundation

extension Int {
    func divisorsSum() -> Int {
        let divisors = (1...Int(sqrt(Double(self)))).filter { self % $0 == 0 }
        return divisors.flatMap { $0 == 1 ? [1] : [$0, self / $0] }.reduce(0, +)
    }
}

let start = CFAbsoluteTimeGetCurrent()

var amicable = Set<Int>()
let candidates = (1..<10000).reduce(into: [Int: Int]()) { partialResult, int in partialResult[int] = int.divisorsSum() }
candidates.keys.forEach { key in
    guard key != candidates[key] else { return }
    if candidates[candidates[key]!] == key {
        amicable.insert(key)
    }
}
print(amicable.reduce(0, +))
for x in amicable {
    print("\(x)   \(candidates[x]!)")
}

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
