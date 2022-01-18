// https://projecteuler.net/problem=57

import Foundation

func mul(_ bigNumber: [Int], by number: Int) -> [Int] {
    var carry = 0
    var result = [Int]()
    for int in bigNumber.reversed() {
        let totalResult = number * int + carry
        carry = totalResult / 10
        result.append(totalResult % 10)
    }
    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }
    return result.reversed()
}

func sum(_ int1: [Int], _ int2: [Int]) -> [Int] {
    var currentIndex = int1.count - 1
    var currentIndex2 = int2.count - 1
    var carry: Int = 0
    var result: [Int] = []
    while currentIndex >= 0 || currentIndex2 >= 0 {
        var currentTotalSum = carry
        if currentIndex >= 0 {
            currentTotalSum += int1[currentIndex]
        }
        if currentIndex2 >= 0 {
            currentTotalSum += int2[currentIndex2]
        }
        let currentSum = currentTotalSum % 10
        result.append(currentSum)
        carry = currentTotalSum / 10
        currentIndex -= 1
        currentIndex2 -= 1
    }
    if carry > 0 {
        result.append(carry)
    }
    return result.reversed()
}

func add(_ int: Int, _ frac: ([Int], [Int])) -> ([Int], [Int]) {
    (sum(mul(frac.1, by: int), frac.0), frac.1)
}

func reverse(_ frac: ([Int], [Int])) -> ([Int], [Int]) {
    (frac.1, frac.0)
}

let start = CFAbsoluteTimeGetCurrent()

var total = 0
var last = ([2], [1])
for _ in 2...999 {
    last = add(2, reverse(last))
    let result = add(1, reverse(last))
    if result.0.count > result.1.count {
        total += 1
    }
}
print(total)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
