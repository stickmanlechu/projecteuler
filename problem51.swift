// By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
//
// By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
//
// Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

import Foundation

func solve() -> String {
    var primeNumbers: Set<Int> = .init(2...2000000)
    for prime in 2...2000000 where primeNumbers.contains(prime) {
        stride(from: prime + prime, to: 2000001, by: prime).forEach {
            primeNumbers.remove($0)
        }
    }
    let primes = Set(primeNumbers.filter { $0 > 99999 }.map { String($0) })
    for prime in primes.sorted() {
        for maskIndex1 in 0 ..< prime.count - 2 {
            for maskIndex2 in maskIndex1 ..< prime.count - 1 {
                for maskIndex3 in maskIndex2 ..< prime.count {
                    var pattern = Array(prime)
                    guard pattern[maskIndex1] == pattern[maskIndex2] && pattern[maskIndex1] == pattern[maskIndex2] else { continue }
                    var count = 0
                    for i in 0...9 {
                        pattern[maskIndex1] = Character(String(i))
                        pattern[maskIndex2] = Character(String(i))
                        pattern[maskIndex3] = Character(String(i))
                        if primes.contains(String(pattern)) {
                            count += 1
                        }
                    }
                    if count > 7 {
                        print([maskIndex1, maskIndex2, maskIndex3])
                        return prime
                    }
                }
            }
        }
    }
    return "NOT FOUND"
}

let start = CFAbsoluteTimeGetCurrent()

print(solve())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
