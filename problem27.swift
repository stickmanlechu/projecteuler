// https://projecteuler.net/problem=27

import Foundation

extension Int {
    var isPrime: Bool {
        guard self != 0 else { return false }
        let upper = Int(sqrt(Double(abs(self))))
        guard upper > 2 else { return true }
        return (2...upper).first(where: { self % $0 == 0 }) == nil
    }
}

func check(a: Int, b: Int) -> Int {
    var n = 0
    while (n * n + a * n + b).isPrime {
        n += 1
    }
    return n
}

let start = CFAbsoluteTimeGetCurrent()

var theN = 0
var theA = 0
var theB = 0
for a in -999...999 {
    for b in -1000...1000 where b % 2 != 0 {
        let n = check(a: a, b: b)
        guard n > theN else { continue }
        theA = a
        theB = b
        theN = n
    }
}
print("\(theA) x \(theB) = \(theA * theB)")

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

