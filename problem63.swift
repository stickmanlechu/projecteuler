// https://projecteuler.net/problem=63

import Foundation

func pow(_ int: Int, _ n: Int) -> Int {
    let res = String(format: "%.0f", pow(Double(int), Double(n)))
    return res.count
}

let start = CFAbsoluteTimeGetCurrent()

var count = 0
for num in 1...9 {
    for n in 1...39 {
        guard pow(num, n) == n else { break }
        count += 1
    }
}
print(count)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

