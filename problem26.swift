import Foundation

func recurringCycleLength(for denominator: Int) -> Int {
    var fraction = [Int]()
    var processed = [Int: Int]()
    var toDivide = 10
    while true {
        guard processed[toDivide] == nil else {
            break
        }
        processed[toDivide] = fraction.count
        let result = toDivide / denominator
        fraction.append(result)
        guard result != 0 else {
            toDivide *= 10
            continue
        }
        toDivide %= denominator
        if toDivide < denominator {
            toDivide *= 10
        }
        guard toDivide != 0 else {
            return 0
        }
    }
    return fraction.count - processed[toDivide]!
}

let start = CFAbsoluteTimeGetCurrent()

var longest = 0
var d = -1
for i in 3...1000 {
    let length = recurringCycleLength(for: i)
    guard length > 0, longest < length else { continue }
    longest = length
    d = i
}
print(d)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
