//The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
//
//1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
//
//Let us list the factors of the first seven triangle numbers:
//
// 1: 1
// 3: 1,3
// 6: 1,2,3,6
//10: 1,2,5,10
//15: 1,3,5,15
//21: 1,3,7,21
//28: 1,2,4,7,14,28
//We can see that 28 is the first triangle number to have over five divisors.
//
//What is the value of the first triangle number to have over five hundred divisors?

import Foundation

extension Int {
    var divisorsCount: Int {
        (1...Int(sqrt(Double(self)))).reduce(0) { partialResult, candidate in
            guard self % candidate == 0 else { return partialResult }
            return self / candidate == candidate ? partialResult + 1 : partialResult + 2
        }
    }
}

func triangle(_ n: Int) -> Int {
    ((1 + n) * n)/2
}

let start = CFAbsoluteTimeGetCurrent()

var n = 100
var divisors = 0

while triangle(n).divisorsCount < 500 {
    print(n)
    n += 1
}
print(triangle(n))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")