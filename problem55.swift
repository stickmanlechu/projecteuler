// https://projecteuler.net/problem=55

import Foundation

func sum(_ int1: [Int], _ int2: [Int]) -> [Int] {
    var currentIndex = int1.count - 1
    var currentIndex2 = int2.count - 1
    var carry: Int = 0
    var result: [Int] = []
    while currentIndex >= 0 && currentIndex2 >= 0 {
        let currentTotalSum = int1[currentIndex] + int2[currentIndex2] + carry
        let currentSum = currentTotalSum % 10
        result.append(currentSum)
        carry = currentTotalSum / 10
        currentIndex -= 1
        currentIndex2 -= 1
    }
    while currentIndex2 >= 0 {
        let currentTotalSum = int2[currentIndex2] + carry
        let currentSum = currentTotalSum % 10
        result.append(currentSum)
        carry = currentTotalSum / 10
        currentIndex2 -= 1
    }
    if carry > 0 {
        result.append(carry)
    }
    return result.reversed()
}

extension Array where Element == Int {
    var isPalindrome: Bool {
        var start = 0
        var end = count - 1
        while start <= end {
            guard self[start] == self[end] else { return false }
            start += 1
            end -= 1
        }
        return true
    }
    
    var isLychrel: Bool {
        var current = self
        for _ in 1...50 {
            current = sum(current, current.reversed())
            guard !current.isPalindrome else { return false }
        }
        return true
    }
}

extension Int {
    var digits: [Int] {
        var asArray = [Int]()
        var n = self
        while n != 0 {
            asArray.insert(n % 10, at: 0)
            n /= 10
        }
        return asArray
    }
    
    var isLychrel: Bool {
        digits.isLychrel
    }
}

let start = CFAbsoluteTimeGetCurrent()

print((10...9999).filter { $0.isLychrel }.count)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
