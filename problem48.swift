// The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
//
// Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

import Foundation

let start = CFAbsoluteTimeGetCurrent()

var last10 = 0
for i in 1...1000 {
    var currentResult = 1
    for _ in 1...i {
        currentResult *= i
        currentResult %= 10000000000
    }
    last10 += currentResult
    last10 %= 10000000000
}
print(last10)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
