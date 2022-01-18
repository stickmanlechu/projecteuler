// https://projecteuler.net/problem=59

import Foundation

let url = URL(string: "https://projecteuler.net/project/resources/p059_cipher.txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!
let numbers = input
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: ",")
    .map { UInt8($0)! }

let start = CFAbsoluteTimeGetCurrent()

let a = Character("a").asciiValue!
let z = Character("z").asciiValue!

var viableKeys = [String]()
var letterRange = a...z
let visibleRange: ClosedRange<UInt8> = 32...125
for p1 in letterRange {
    for p2 in letterRange {
        for p3 in letterRange {
            let key = [p1, p2, p3]
            let keyString = key.map(UnicodeScalar.init).map(Character.init).map(String.init).joined()
            var viable = true
            var chars = [String]()
            for index in numbers.indices {
                let keyIndex = index % key.count
                let result = numbers[index] ^ key[keyIndex]
                guard visibleRange.contains(result) else {
                    viable = false
                    break
                }
                chars.append(String(Character(UnicodeScalar(result))))
            }
            if viable && chars.joined().contains("Euler") {
                viableKeys.append(keyString)
            }
        }
    }
}
print(viableKeys.first!)
let key = Array(viableKeys.first!).compactMap(\.asciiValue)
var chars = [String]()
var sum: Int = 0
for index in numbers.indices {
    let keyIndex = index % key.count
    sum += Int(numbers[index] ^ key[keyIndex])
}
print(sum)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
