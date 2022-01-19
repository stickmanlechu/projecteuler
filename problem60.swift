// https://projecteuler.net/problem=60

import Foundation

extension Int {
    static let primes: Set<Int> = {
        var primes: Set<Int> = .init(2...999999)
        for prime in 2...999999 where primes.contains(prime) {
            stride(from: prime + prime, to: 1000000, by: prime).forEach {
                primes.remove($0)
            }
        }
        return primes
    }()
    
    static let sortedPrimes = primes.filter { $0 < 10000 && $0 != 2 && $0 != 5 }.sorted()
    
    static let maxPrime = primes.max()!
    
    var isPrime: Bool {
        guard self > Self.maxPrime else {
            return Self.primes.contains(self)
        }
        guard self != 0 else { return false }
        let upper = Int(sqrt(Double(abs(self))))
        guard upper > 2 else { return true }
        return (2...upper).first(where: { self % $0 == 0 }) == nil
    }
}

func check(_ i1: Int, _ i2: Int) -> Bool {
    let str1 = String(Int.sortedPrimes[i1])
    let str2 = String(Int.sortedPrimes[i2])
    return Int(str1 + str2)!.isPrime && Int(str2 + str1)!.isPrime
}

func solve() -> Int {
    for i1 in Int.sortedPrimes.indices.dropLast(4) {
        for i2 in Int.sortedPrimes.indices.dropFirst(i1 + 1).dropLast(3) where check(i1, i2) {
            for i3 in Int.sortedPrimes.indices.dropFirst(i2 + 1).dropLast(2)  where check(i1, i3) && check(i2, i3) {
                for i4 in Int.sortedPrimes.indices.dropFirst(i3 + 1).dropLast() where check(i1, i4) && check(i2, i4) && check(i3, i4) {
                    for i5 in Int.sortedPrimes.indices.dropFirst(i4 + 1) where check(i1, i5) && check(i2, i5) && check(i3, i5) && check(i4, i5) {
                        return [i1, i2, i3, i4, i5].map { Int.sortedPrimes[$0] }.reduce(0, +)
                    }
                }
            }
        }
    }
    return -1
}

let start = CFAbsoluteTimeGetCurrent()


print(solve())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
