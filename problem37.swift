// The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
//
// Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

import Foundation

extension Int {
    var truncated: Set<Int> {
        guard self > 10 else { return [self] }
        return Set(truncatedLeft + truncatedRight)
    }
    
    var truncatedRight: [Int] {
        guard self > 10 else { return [self] }
        return [self] + (self / 10).truncatedRight
    }
    
    var truncatedLeft: [Int] {
        guard self > 10 else { return [self] }
        return [self] + Int(String(self).dropFirst())!.truncatedLeft
    }
}

let start = CFAbsoluteTimeGetCurrent()

var sum = 0
var cnt = 0
var primes: Set<Int> = .init(2...999999)
for prime in 2...999999 where primes.contains(prime) {
    stride(from: prime + prime, to: 1000000, by: prime).forEach { primes.remove($0) }
}
for prime in primes where prime > 10 {
    let truncated = prime.truncated
    guard primes.intersection(truncated) == truncated else { continue }
    cnt += 1
    sum += prime
    if cnt == 11 { break }
}
print(sum)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
