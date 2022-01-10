//An irrational decimal fraction is created by concatenating the positive integers:
//
//0.123456789101112131415161718192021...
//
//It can be seen that the 12th digit of the fractional part is 1.
//
//If dn represents the nth digit of the fractional part, find the value of the following expression.
//
//d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

import Foundation

let start = CFAbsoluteTimeGetCurrent()

var i = 0
var nums = [1000000, 100000, 10000, 1000, 100, 10, 1]
var currentIndex = 0
var mults = 1
while let lookingForIndex = nums.popLast() {
    let chars = Array(String(i))
    defer {
        i += 1
        currentIndex += chars.count
    }
    guard lookingForIndex < (currentIndex + chars.count) else {
        nums.append(lookingForIndex)
        continue
    }
    let relIndex = lookingForIndex - currentIndex
    mults *= Int(String(chars[relIndex]))!
}
print(mults)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
