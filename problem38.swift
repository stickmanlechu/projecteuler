//Take the number 192 and multiply it by each of 1, 2, and 3:
//
//192 × 1 = 192
//192 × 2 = 384
//192 × 3 = 576
//By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
//
//The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
//
//What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

import Foundation

func concat(_ int: Int, max: Int) -> String {
    (1...max).reduce(into: "") {
        $0.append(String(int * $1))
    }
}

let start = CFAbsoluteTimeGetCurrent()

var found = Set<String>()
(9001...9999).forEach {
    let val = concat($0, max: 2)
    guard Set(val).count == 9 else { return }
    guard !val.contains("0") else { return }
    found.insert(val)
}
print(found.map { Int($0)! }.max()!)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
