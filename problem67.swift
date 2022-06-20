// https://projecteuler.net/problem=67

import Foundation

let text = try! String(contentsOf: URL(string: "https://projecteuler.net/project/resources/p067_triangle.txt")!)
print(text)
var triangle = text
    .components(separatedBy: "\n")
    .filter { !$0.isEmpty }
    .map { line in
        line
            .components(separatedBy: " ")
            .compactMap { Int($0) }
    }

func mostExpensivePath(row: Int, col: Int) -> Int {
    guard row < triangle.count else { return 0 }
    guard col < triangle[row].count else { return 0 }
    return triangle[row][col] + max(mostExpensivePath(row: row + 1, col: col), mostExpensivePath(row: row + 1, col: col + 1))
}

func mostExpensivePath() -> Int {
    for row in triangle.indices.dropFirst().reversed() {
        for col in triangle[row - 1].indices {
            triangle[row - 1][col] += max(triangle[row][col], triangle[row][col + 1])
        }
    }
    return triangle[0][0]
}

let start = CFAbsoluteTimeGetCurrent()

//print(mostExpensivePath(row: 0, col: 0))
print(mostExpensivePath())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
