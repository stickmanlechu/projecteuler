// The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
//
// We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
//
// There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
//
// If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

import Foundation

let start = CFAbsoluteTimeGetCurrent()

func frac(_ x: Int, _ y: Int) -> Double {
    Double(x) / Double(y)
}

for x in 10...98 {
    for y in (x + 1)...99 {
        let top = Set([(x / 10), (x % 10)])
        let bottom = Set([(y / 10), (y % 10)])
        guard top != bottom else { continue }
        let intersection = top.intersection(bottom)
        guard !intersection.isEmpty && intersection.first! != 0 else { continue }
        let top1 = top.count == 1 ? top.first! : top.subtracting(bottom).first!
        let bottom1 = bottom.count == 1 ? bottom.first! : bottom.subtracting(top).first!
        guard frac(top1, bottom1) == frac(x, y) else { continue }
        print("\(x)/\(y)")
    }
}

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

