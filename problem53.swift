// https://projecteuler.net/problem=53

import Foundation

func triangle(_ n: Int, _ k: Int) -> Int {
    guard k < n else { return 1 }
    guard k != 0 else { return 1 }
    let nom = (max(k, n - k) + 1 ... n).reduce(1, *)
    let den = (1 ... min(k, n - k)).reduce(1, *)
    return nom / den
}

let start = CFAbsoluteTimeGetCurrent()

let total = (23...100).reduce(0) { partialResult, int in
    guard let firstOverMillion = (0 ... int / 2).first(where: { triangle(int, $0) > 1000000 }) else { return partialResult }
    return partialResult + (int + 1) - 2 * firstOverMillion
}
print(total)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
