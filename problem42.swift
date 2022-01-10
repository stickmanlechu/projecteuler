// https://projecteuler.net/problem=42

import Foundation

let url = URL(string: "https://projecteuler.net/project/resources/p042_words.txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!
let words = input
    .replacingOccurrences(of: "\"", with: "")
    .components(separatedBy: ",")

extension String {
    static let start = Int(Character("A").asciiValue!)
    
    var score: Int {
        map { Int($0.asciiValue!) - Self.start + 1 }.reduce(0, +)
    }
}

let start = CFAbsoluteTimeGetCurrent()

let triangles = Set((1...20).map { ($0 * ($0 + 1)) / 2 })
let cnt = words.map(\.score).filter { triangles.contains($0) }.count
print(cnt)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
