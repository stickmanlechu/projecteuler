//The prime factors of 13195 are 5, 7, 13 and 29.
//What is the largest prime factor of the number 600851475143 ?

import Foundation

func primes(upTo number: Int) -> [Int] {
    var candidates = Array(2...number)
    var i = 0
    var size = 10
    while i < candidates.endIndex - 1 {
        let candidate = candidates[i]
        
        if candidate > size {
            print("\(size) - \(candidate)")
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

let start = CFAbsoluteTimeGetCurrent()

let num = 600851475143
let maxFactor = Int(floor(sqrt(Double(num))))

for c in primes(upTo: maxFactor).reversed() {
    guard num % c == 0 else { continue }
    print(c)
    break
}

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
