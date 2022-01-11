// The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
//
// There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
//
// What 12-digit number do you form by concatenating the three terms in this sequence?

import Foundation

func permute(left: String) -> [String] {
    guard left.count > 1 else {
        return [left]
    }
    return left.indices.flatMap { index -> [String] in
        var newLeft = left
        newLeft.remove(at: index)
        return permute(left: newLeft).map { left[index ..< left.index(after: index)] + $0 }
    }
}

func hasProperRecurringDiff(among ints: [Int]) -> Bool {
    var diffs = [Int: Int]()
    var count = 0
    for i in ints.indices {
        for j in ints.indices.dropFirst(i) where j != i {
            count += 1
            diffs[ints[j] - ints[i], default: 0] += 1
        }
    }
    let diffAndMax = diffs.sorted { $0.value > $1.value }.first!
    return diffAndMax.value > 1 && diffAndMax.key == 3330
}

let start = CFAbsoluteTimeGetCurrent()

var primes: Set<Int> = .init(2...10000)
for prime in 2...10000 where primes.contains(prime) {
    stride(from: prime + prime, to: 10001, by: prime).forEach {
        primes.remove($0)
    }
}
var found = Set<[Int]>()
for prime in primes.filter({ $0 > 999 }).sorted() {
    let permutations = Set(permute(left: String(prime)).map { Int($0)! })
    let primePermutations = primes.intersection(permutations)
    guard primePermutations.count > 2 else { continue }
    let sorted = primePermutations.sorted()
    guard hasProperRecurringDiff(among: sorted) else { continue }
    found.insert(sorted)
}
print(found)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
