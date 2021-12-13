//The following iterative sequence is defined for the set of positive integers:
//
//n → n/2 (n is even)
//n → 3n + 1 (n is odd)
//
//Using the rule above and starting with 13, we generate the following sequence:
//
//13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
//It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
//
//Which starting number, under one million, produces the longest chain?
//
//NOTE: Once the chain starts the terms are allowed to go above one million.

import Foundation

var lenghtMap: [Int: Int] = [:]

func nextCollatz(for num: Int) -> Int {
    num % 2 == 0 ? (num / 2) : (3 * num + 1)
}

func collatzLength(for num: Int) -> Int {
    if num == 1 { return 1 }
    if let len = lenghtMap[num] { return len }
    let len = 1 + collatzLength(for: nextCollatz(for: num))
    lenghtMap[num] = len
    return len
}

let start = CFAbsoluteTimeGetCurrent()

var currentMax = (1, 1)
for n in 2..<1000000 {
    let len = collatzLength(for: n)
    if len > currentMax.1 {
        currentMax = (n, len)
    }
}
print("\(currentMax.0) \(currentMax.1)")

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
