import Foundation

struct Num: Hashable {
    let a: Int
    let b: Int
    
    func pow(_ x: Int) -> Num {
        Num(a: a, b: b * x)
    }
    
    func eval() -> Int {
        var res = 1
        for _ in 1...b {
            res *= a
        }
        return res
    }
}

let start = CFAbsoluteTimeGetCurrent()

var allNums = Set<Num>()
var stack = Array(2...100)
while let a = stack.first {
    var powa = a
    var b = 1
    while powa <= 100 {
        allNums.insert(.init(a: a, b: b))
        stack.removeAll(where: { $0 == powa })
        powa *= a
        b += 1
    }
}
var totalNums = Set<Num>()
for b in 2...100 {
    for num in allNums {
        totalNums.insert(num.pow(b))
    }
}
print(totalNums.count)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
