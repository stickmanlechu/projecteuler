//A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
//
//012   021   102   120   201   210
//
//What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

import Foundation

func permute(left: [String]) -> [String] {
    guard left.count > 1 else {
        return left
    }
    return left.flatMap { str -> [String] in
        var newLeft = left
        newLeft.removeAll(where: { $0 == str })
        return permute(left: newLeft).map { str + $0 }
    }
}

let start = CFAbsoluteTimeGetCurrent()

let permutations = permute(left: (0...9).map(String.init)).sorted()
print(permutations[999999])

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
