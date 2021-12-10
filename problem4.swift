//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//Find the largest palindrome made from the product of two 3-digit numbers.

import Foundation

extension String {
    var isPalindrome: Bool {
        Array(self) == Array(self).reversed()
    }
}

let start = CFAbsoluteTimeGetCurrent()

let largest = Array(Set((100...999).flatMap { i in (100...999).map { $0 * i } }))
    .sorted()
    .reversed()
    .map(String.init)
    .first(where: { $0.isPalindrome })
print(largest!)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
