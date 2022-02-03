// https://projecteuler.net/problem=61

import Foundation

func triangle(_ x: Int) -> Int {
    (x * (x + 1)) / 2
}

func square(_ x: Int) -> Int {
    x * x
}

func pentagonal(_ x: Int) -> Int {
    (x * (3 * x - 1)) / 2
}

func hexagonal(_ x: Int) -> Int {
    x * (2 * x - 1)
}

func heptagonal(_ x: Int) -> Int {
    (x * (5 * x - 3)) / 2
}

func octagonal(_ x: Int) -> Int {
    x * (3 * x - 2)
}

func gen(_ fn: (Int) -> Int) -> [Int] {
    var generated = [Int]()
    var i = 19
    while true {
        defer { i += 1 }
        let newGen = fn(i)
        guard newGen > 1000 else { continue }
        guard newGen < 10000 else { break }
        generated.append(newGen)
    }
    return generated
}

func check(_ i1: Int, _ i2: Int) -> Bool {
    return (i1 % 100) == (i2 / 100)
}

func permute(left: [Int]) -> [[Int]] {
    guard left.count > 1 else {
        return [left]
    }
    return left.indices.flatMap { index -> [[Int]] in
        var newLeft = left
        newLeft.remove(at: index)
        return permute(left: newLeft).map { left[index ..< left.index(after: index)] + $0 }
    }
}

func solve(_ numbers: [[Int]]) -> Int {
    for indices in permute(left: Array(numbers.indices)) {
        for i1 in numbers[indices[0]] {
            for i2 in numbers[indices[1]] where check(i1, i2) {
                for i3 in numbers[indices[2]] where check(i2, i3) {
                    for i4 in numbers[indices[3]] where check(i3, i4) {
                        for i5 in numbers[indices[4]] where check(i4, i5) {
                            for i6 in numbers[indices[5]] where check(i5, i6) && check(i6, i1) {
                                return i1 + i2 + i3 + i4 + i5 + i6
                            }
                        }
                    }
                }
            }
        }
    }
    return -1
}

let start = CFAbsoluteTimeGetCurrent()

let numbers = [
    gen(triangle),
    gen(square),
    gen(pentagonal),
    gen(hexagonal),
    gen(heptagonal),
    gen(octagonal)
]
print(solve(numbers))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
