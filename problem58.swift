// https://projecteuler.net/problem=58

import Foundation

extension Int {
    var isPrime: Bool {
        guard self != 0 else { return false }
        let upper = Int(sqrt(Double(abs(self))))
        guard upper > 2 else { return true }
        return (2...upper).first(where: { self % $0 == 0 }) == nil
    }
}

func solve() -> Int {
    var spiral = 1
    var prime: Double = 0
    var total: Double = 1
    for size in stride(from: 3, to: 100000, by: 2) {
        (1...4).forEach { _ in
            spiral = spiral + size - 1
            if spiral.isPrime {
                prime += 1
            }
            total += 1
        }
        guard prime / total > 0.1 else {
            return size
        }
    }
    return -1
}

let start = CFAbsoluteTimeGetCurrent()

print(solve())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
