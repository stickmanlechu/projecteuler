// The first two consecutive numbers to have two distinct prime factors are:
//
// 14 = 2 × 7
// 15 = 3 × 5
//
// The first three consecutive numbers to have three distinct prime factors are:
//
// 644 = 2² × 7 × 23
// 645 = 3 × 5 × 43
// 646 = 2 × 17 × 19.
//
// Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?

import Foundation

extension Int {
    static let primes: Set<Int> = {
        var primes: Set<Int> = .init(2...999)
        for prime in 2...999 where primes.contains(prime) {
            stride(from: prime + prime, to: 1000, by: prime).forEach {
                primes.remove($0)
            }
        }
        return primes
    }()
    
    static let sortedPrimes: [Int] = primes.sorted()
    
    static let theMax = primes.max()!
    
    var countOfPrimeFactors: Int {
        let maxPrime = Int(sqrt(Double(self)))
        var prms = Set<Int>()
        var n = self
        for prime in Self.sortedPrimes {
            guard prime <= maxPrime else { break }
            while n % prime == 0 {
                prms.insert(prime)
                n /= prime
            }
        }
        return (Self.primes.contains(n) ? 1 : 0) + prms.count
    }
}

func solve(for numberOfDistinctPrimeFactors: Int) -> Int {
    var first = 10
    while true {
        let range = first...(first + numberOfDistinctPrimeFactors - 1)
        guard let n = range.first(where: { $0.countOfPrimeFactors != numberOfDistinctPrimeFactors }) else {
            return first
        }
        first = n == first ? n + 1 : n
    }
}

let start = CFAbsoluteTimeGetCurrent()

print(solve(for: 4))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
