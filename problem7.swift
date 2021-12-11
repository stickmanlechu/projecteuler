//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
//What is the 10 001st prime number?

import Foundation

let start = CFAbsoluteTimeGetCurrent()

var primes = [2, 3, 5, 7, 11, 13]
var current = 17
while primes.count <= 10000 {
    if primes.first(where: { current % $0 == 0 }) == nil {
        primes.append(current)
    }
    current += 2
}
print(primes.last!)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
