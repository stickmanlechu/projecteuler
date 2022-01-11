// It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
//
// 9 = 7 + 2×12
// 15 = 7 + 2×22
// 21 = 3 + 2×32
// 25 = 7 + 2×32
// 27 = 19 + 2×22
// 33 = 31 + 2×12
//
// It turns out that the conjecture was false.
//
// What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

import Foundation

func findFirstComposite() -> Int {
    var primes: Set<Int> = .init(2...99999)
    var composite: Set<Int> = []
    for prime in 2...99999 where primes.contains(prime) {
        stride(from: prime + prime, to: 100000, by: prime).forEach {
            primes.remove($0)
            if $0 % 2 == 1 {
                composite.insert($0)
            }
        }
    }
    let sortedPrimes = primes.sorted()
    for c in composite.sorted() {
        for p in sortedPrimes {
            guard p < c else {
                return c
            }
            let c1 = c - p
            guard c1 % 2 == 0 else { continue }
            let c2 = c1 / 2
            let sqc2 = Int(sqrt(Double(c2)))
            guard sqc2 * sqc2 == c2 else { continue }
            print("\(c) = \(p) + 2 * \(sqc2)^2")
            break
        }
    }
    return -1
}

let start = CFAbsoluteTimeGetCurrent()

print(findFirstComposite())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

