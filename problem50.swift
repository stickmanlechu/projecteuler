// The prime 41, can be written as the sum of six consecutive primes:
//
// 41 = 2 + 3 + 5 + 7 + 11 + 13
// This is the longest sum of consecutive primes that adds to a prime below one-hundred.
//
// The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
//
// Which prime, below one-million, can be written as the sum of the most consecutive primes?

import Foundation

let start = CFAbsoluteTimeGetCurrent()

var primes: Set<Int> = .init(2...999999)
for prime in 2...999999 where primes.contains(prime) {
    stride(from: prime + prime, to: 1000000, by: prime).forEach {
        primes.remove($0)
    }
}
let sortedPrimes: [Int] = primes.sorted()

var longest = 0
var sumOfLongest = 0
for startIndex in sortedPrimes.indices.dropLast() {
    for endIndex in (startIndex + 1)..<sortedPrimes.endIndex {
        let sum = sortedPrimes[startIndex...endIndex].reduce(0, +)
        guard sum < 1000000 else { break }
        guard primes.contains(sum) else { continue }
        let candidate = endIndex - startIndex + 1
        guard longest < candidate else { continue }
        longest = candidate
        sumOfLongest = sum
    }
}
print(longest)
print(sumOfLongest)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
