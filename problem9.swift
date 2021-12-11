//A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
//a^2 + b^2 = c^2
//For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
//
//There exists exactly one Pythagorean triplet for which a + b + c = 1000.
//Find the product abc.

import Foundation

func resolve() -> Int {
    for a in 1...999 {
        for b in 1...999 {
            for c in 1...999 {
                guard a + b + c == 1000 else { continue }
                guard a * a + b * b == c * c else { continue }
                return a * b * c
            }
        }
    }
    return -1
}

let start = CFAbsoluteTimeGetCurrent()

print(resolve())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
