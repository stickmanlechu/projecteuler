//The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
//Find the sum of all the primes below two million.

import Foundation

let start = CFAbsoluteTimeGetCurrent()

let max = 2000000
var marked = (0...max).map { _ in true }
marked[0] = false
marked[1] = false
for i in marked.indices.dropFirst(2) {
    if !marked[i] { continue }
    var j = i + i
    while j < marked.count {
        marked[j] = false
        j += i
    }
}
print(marked.indices.filter { marked[$0] }.reduce(0, +))


let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
