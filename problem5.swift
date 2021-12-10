//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

import Foundation

func findPrimes(upTo number: Int) -> [Int] {
    var candidates = Array(2...number)
    var i = 0
    var size = 10
    while i < candidates.endIndex - 1 {
        let candidate = candidates[i]
        
        if candidate > size {
            size *= 10
        }
        
        let square = candidate * candidate
        (i+1..<candidates.endIndex)
            .filter { candidates[$0] >= square && candidates[$0] % candidate == 0 }
            .reversed()
            .forEach { candidates.remove(at: $0) }
        i += 1
    }
    return candidates
}

extension Int {
    func intDivisions(with int: Int) -> Int {
        var counter = 0
        var result = self
        while result % int == 0 {
            counter += 1
            result /= int
        }
        return counter
    }
}

let start = CFAbsoluteTimeGetCurrent()

let primes = Set(findPrimes(upTo: 20))
let notPrimes = Set((4...20).filter { !primes.contains($0) })
var result = 1

for prime in primes.sorted() {
    let maxTimesNeeded = notPrimes.map { $0.intDivisions(with: prime) }.max()!
    print("\(prime) - \(maxTimesNeeded)")
    result *= (1...(maxTimesNeeded == 0 ? 1 : maxTimesNeeded)).reduce(1) { partialResult, _ in partialResult * prime }
}
print(result)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
