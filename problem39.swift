//If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
//
//{20,48,52}, {24,45,51}, {30,40,50}
//
//For which value of p ≤ 1000, is the number of solutions maximised?

import Foundation

func findInts(for p: Int) -> Set<[Int]> {
    var res = Set<[Int]>()
    for a in 1..<p {
        let nom = (p * p - 2 * p * a)
        let den = (2 * p - 2 * a)
        guard nom % den == 0 else { continue }
        let b = nom / den
        guard b > 0 else { continue }
        let c = Int(sqrt(Double(a * a + b * b)))
        guard a + b + c == p else { continue }
        res.insert([a, b, c].sorted())
    }
    return res
}

let start = CFAbsoluteTimeGetCurrent()

var maxP = 0
var maxAbc = 0
for p in 1...1000 {
    let found = findInts(for: p).count
    guard found > maxAbc else { continue }
    maxAbc = found
    maxP = p
}
print("\(maxP)    \(maxAbc)")

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
