// The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
//
// Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

import Foundation

extension String {
    var isPalindrome: Bool {
        Array(self) == reversed()
    }
}

let start = CFAbsoluteTimeGetCurrent()

var sum = 0
for i in 1...999999 {
    guard String(i).isPalindrome else { continue }
    guard String(i, radix: 2).isPalindrome else { continue }
    sum += i
}
print(sum)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
