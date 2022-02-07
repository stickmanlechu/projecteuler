// https://projecteuler.net/problem=64

import Foundation

let start = CFAbsoluteTimeGetCurrent()

var result = 0

var limit = 1
for n in 2...10000 {
    guard (limit + 1) * (limit + 1) != n else {
        limit += 1
        continue
    }
    
    var period = 0
    var d = 1
    var m = 0
    var a = limit

    repeat {
        m = d * a - m
        d = (n - m * m) / d
        a = (limit + m) / d
        period += 1
    } while a != 2 * limit
    
    guard period % 2 == 1 else { continue }
    result += 1
}

print(result)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
