//If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
//If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
//
//
//NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

import Foundation

var basicMapping: [Int: Int] = [1: 3, 2: 3, 3: 5, 4: 4, 5: 4, 6: 3, 7: 5, 8: 5, 9: 4, 10: 3, 11: 6, 12: 6, 13: 8, 14: 8, 15: 7, 16: 7, 17: 9, 18: 8, 19: 8, 20: 6, 30: 6, 40: 5, 50: 5, 60: 5, 70: 7, 80: 6, 90: 6]

func countLetters(of int: Int) -> Int {
    if let basic = basicMapping[int] { return basic }
    var count = 0
    let tens = int % 100
    if let tensCount = basicMapping[tens] {
        count = tensCount
    } else if let tensCount = basicMapping[tens - (tens % 10)], let singlesCount = basicMapping[tens % 10] {
        count = tensCount + singlesCount
    }
    let hundreds = int / 100
    if hundreds > 0 {
        count += basicMapping[hundreds]! + 7
        if tens > 0 {
            count += 3 //and
        }
    }
    return count
}

let start = CFAbsoluteTimeGetCurrent()

print((1..<1000).map(countLetters(of:)).reduce(0, +) + "onethousand".count)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")

