// In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
//
// 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
// It is possible to make £2 in the following way:
//
// 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
// How many different ways can £2 be made using any number of coins?

import Foundation

let coins = [1, 2, 5, 10, 20, 50, 100, 200]

func find(sum: Int, minIndex: Int, currentSum: Int) -> Int {
    guard currentSum <= sum else { return 0 }
    guard currentSum != sum else { return 1 }
    return (minIndex..<coins.endIndex).reduce(0) { $0 + find(sum: sum, minIndex: $1, currentSum: currentSum + coins[$1]) }
}

let start = CFAbsoluteTimeGetCurrent()

print(find(sum: 200, minIndex: 0, currentSum: 0))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
