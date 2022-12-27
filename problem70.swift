// https://projecteuler.net/problem=70

import Foundation

var globalFactors: [Int: Set<Int>] = [:]

let primes: Set<Int> = {
    let limit = 5000
    var primes: Set<Int> = .init(2...limit)
    for prime in 2...limit where primes.contains(prime) {
        stride(from: prime + prime, to: limit + 1, by: prime).forEach {
            primes.remove($0)
        }
    }
    return primes
}()

func toArray(_ n: Int) -> [Int] {
    var n = n
    var digits = [Int]()
    while n > 0 {
        digits.append(n % 10)
        n /= 10
    }
    return digits.sorted()
}

let start = CFAbsoluteTimeGetCurrent()

var minN = 0
var minRatio = Float.infinity

let sortedPrimes = primes.sorted()
for i in sortedPrimes.indices {
    for j in sortedPrimes.indices.dropFirst() {
        let prime1 = sortedPrimes[i]
        let prime2 = sortedPrimes[j]
        let n = prime1 * prime2
        guard n < 10000000 else { continue }
        let totient = (prime1 - 1) * (prime2 - 1)
        guard toArray(n) == toArray(totient) else { continue }
        let ratio = Float(n) / Float(totient)
        guard ratio < minRatio else { continue }
        minN = n
        minRatio = ratio
    }
}
print("\(minN)   \(minRatio)")

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
