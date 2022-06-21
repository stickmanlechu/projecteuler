// https://projecteuler.net/problem=68

import Foundation

var ring: [[Int]] = (1...5).map { _ in [0, 0, 0] }
let indices: [[Int]] = [[0], [1, 14], [2, 4], [3], [5,7], [6], [8, 10], [9], [11, 13], [12]]

func permute(_ array: [Int], pos: Int = 0) -> [[Int]] {
    guard array.count > 1 else {
        return [[array.first!]]
    }
    return array.indices.filter({ !([1, 2, 4, 6, 8].contains(pos) && array[$0] == 10) }).reduce(into: [[Int]]()) { partialResult, index in
        var newArray = array
        let element = newArray.remove(at: index)
        if pos == 0 && element == 0 { return }
        partialResult.append(contentsOf: permute(newArray, pos: pos + 1).map {
            [element] + $0
        })
    }
}

var maxString = "0000000000000000"
for permutation in permute(Array(1...10)) {
    for index in permutation.indices {
        for i in indices[index] {
            let row = i / 3
            let col = i % 3
            ring[row][col] = permutation[index]
        }
    }
    let reducedSum = Set(ring.map { $0.reduce(0, +) })
    guard reducedSum.count == 1 else { continue }
    let startIndex = ring.enumerated().min(by: { a, b in a.element[0] < b.element[0] })!.offset
    var resultString: String = ""
    for i in 0...4 {
        resultString += ring[(startIndex + i) % 5].map(String.init).joined(separator: "")
    }
    if resultString > maxString {
        maxString = resultString
    }
}

print(maxString)
