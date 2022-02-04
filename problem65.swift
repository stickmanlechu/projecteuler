// https://projecteuler.net/problem=65

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

func c(_ i: Int) -> Int {
    guard i != 1 else { return 2 }
    return (i % 3 == 0) ? 2 * (i / 3) : 1
}

func solve(_ steps: Int) -> Int {
    var nom = [1]
    var den = [c(steps)]
    for step in (1 ..< steps).reversed() {
        let temp = nom
        nom = den
        den = sum(mul(den, by: c(step)), temp)
    }
    return den.reduce(0, +)
}

let start = CFAbsoluteTimeGetCurrent()

print(solve(100))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
