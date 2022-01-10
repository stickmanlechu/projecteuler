//The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
//
//There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
//
//How many circular primes are there below one million?

import Foundation

extension Int {
    var digits: [Int] {
        var d = self
        var res = [Int]()
        while d != 0 {
            res.append(d % 10)
            d /= 10
        }
        return res.reversed()
    }
}

extension RandomAccessCollection where Element == Int, Index == Int {
    func asInt() -> Int {
        indices.reduce(0) { $0 + self[$1] * pwr(10, count - $1 - 1) }
    }
}

func pwr(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? 1 : (1...y).reduce(1) { r, _ in r * x }
}

func findCircularPrimes() -> Set<Int> {
    var primes: Set<Int> = .init(2...999999)
    for prime in 2...999999 where primes.contains(prime) {
        stride(from: prime + prime, to: 1000000, by: prime).forEach { primes.remove($0) }
    }
    primes.forEach { prime in
        var digits = prime.digits
        guard digits.allSatisfy({ $0 % 2 != 0 }) else {
            primes.remove(prime)
            return
        }
        var rotations = Set<Int>()
        for _ in 1...digits.count {
            rotations.insert(digits.asInt())
            digits.append(digits.removeFirst())
        }
        if primes.intersection(rotations) != rotations {
            primes.subtract(rotations)
        }
    }
    primes.insert(2)
    return primes
}

let start = CFAbsoluteTimeGetCurrent()

print(findCircularPrimes().count)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
