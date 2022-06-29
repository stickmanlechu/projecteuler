// https://projecteuler.net/problem=69

import Foundation

let primes: Set<Int> = {
    let limit = 999999
    var primes: Set<Int> = .init(2...limit)
    for prime in 2...limit where primes.contains(prime) {
        stride(from: prime + prime, to: limit + 1, by: prime).forEach {
            primes.remove($0)
        }
    }
    return primes
}()

let start = CFAbsoluteTimeGetCurrent()

let max = 1000000
var result = 1
for prime in primes.sorted() {
    guard result * prime <= max else { break }
    result *= prime
}
print(result)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
