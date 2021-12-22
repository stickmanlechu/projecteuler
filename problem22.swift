// Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
//
// For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
//
// What is the total of all the name scores in the file?

import Foundation

let url = URL(string: "https://projecteuler.net/project/resources/p022_names.txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!
let names = input
    .split(separator: ",")
    .map(String.init)
    .map {
        $0.replacingOccurrences(of: "\"", with: "")
    }

let start = CFAbsoluteTimeGetCurrent()

let totalScore = names
    .sorted()
    .enumerated()
    .map { name in
        let asciiScore = name
            .element
            .compactMap(\.asciiValue)
            .map { Int($0) - 64 }
            .reduce(0, +)
        return asciiScore * (name.offset + 1)
    }
    .reduce(0, +)
print(totalScore)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
