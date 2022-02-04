// https://projecteuler.net/problem=62

import Foundation

let start = CFAbsoluteTimeGetCurrent()

let cubes = (1...9999).map { $0 * $0 * $0 }
var cubeCount = [String: Int]()
var cubeKey = [Int: String]()
for cube in cubes {
    let val = String(String(cube).sorted())
    cubeKey[cube] = val
    cubeCount[val, default: 0] += 1
}
let values = cubeCount.filter { $0.value == 5 }.map(\.key)
let keys = cubeKey.filter { values.contains($0.value) }.map(\.key)
print(keys.sorted().first!)


let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
