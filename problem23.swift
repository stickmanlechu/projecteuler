//A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
//
//A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
//
//As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
//
//Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
                                    
import Foundation

extension Int {
    func divisorsSum() -> Int {
        let divisors = (1...Int(sqrt(Double(self)))).filter { self % $0 == 0 }
        return Set(divisors.flatMap { $0 == 1 ? [1] : [$0, self / $0] }).reduce(0, +)
    }
}

let start = CFAbsoluteTimeGetCurrent()

let abundant = (1...28123).filter { $0.divisorsSum() > $0 }
var sums = Set<Int>()
for n1 in abundant {
    for n2 in abundant {
        let s = n1 + n2
        if s > 28123 { break }
        sums.insert(s)
    }
}
print(Set(1...28123).subtracting(sums).reduce(0, +))

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
