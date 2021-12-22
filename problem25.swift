// The Fibonacci sequence is defined by the recurrence relation:
//
// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
//
// F1 = 1
// F2 = 1
// F3 = 2
// F4 = 3
// F5 = 5
// F6 = 8
// F7 = 13
// F8 = 21
// F9 = 34
// F10 = 55
// F11 = 89
// F12 = 144
// The 12th term, F12, is the first term to contain three digits.
//
// What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

import Foundation

func sum(int1: [Int], int2: [Int]) -> [Int] {
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

func fibo(n0: [Int], n1: [Int], i: Int) -> Int {
    let current = sum(int1: n0, int2: n1)
    guard current.count < 1000 else { return i }
    return fibo(n0: n1, n1: current, i: i + 1)
}

let start = CFAbsoluteTimeGetCurrent()

print(fibo(n0: [1], n1: [1], i: 3))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
