// A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
//
// 1/2    =     0.5
// 1/3    =     0.(3)
// 1/4    =     0.25
// 1/5    =     0.2
// 1/6    =     0.1(6)
// 1/7    =     0.(142857)
// 1/8    =     0.125
// 1/9    =     0.(1)
// 1/10    =     0.1
// Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
//
// Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

import Foundation

func recurringCycleLength(for denominator: Int) -> Int {
    var fraction = [Int]()
    var processed = [Int: Int]()
    var toDivide = 10
    while true {
        guard processed[toDivide] == nil else {
            break
        }
        processed[toDivide] = fraction.count
        let result = toDivide / denominator
        fraction.append(result)
        guard result != 0 else {
            toDivide *= 10
            continue
        }
        toDivide %= denominator
        if toDivide < denominator {
            toDivide *= 10
        }
        guard toDivide != 0 else {
            return 0
        }
    }
    return fraction.count - processed[toDivide]!
}

let start = CFAbsoluteTimeGetCurrent()

var longest = 0
var d = -1
for i in 3...1000 {
    let length = recurringCycleLength(for: i)
    guard length > 0, longest < length else { continue }
    longest = length
    d = i
}
print(d)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
