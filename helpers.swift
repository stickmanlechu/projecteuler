extension Array where Element == Int {
    func greaterThan(_ another: [Int]) -> Bool {
        guard count == another.count else {
            return count > another.count
        }
        for index in indices {
            if self[index] > another[index] { return true }
            guard self[index] == another[index] else { return false }
        }
        // equal
        return false
    }
}

extension Int {
    func isSquare() -> Bool {
        let sq = Int(sqrt(Double(self)))
        return sq * sq == self
    }
    
    var digits: [Int] {
        var d = self
        var res = [Int]()
        while d != 0 {
            res.append(d % 10)
            d /= 10
        }
        return res.reversed()
    }
}

func mul(_ bigNumber: [Int], by number: Int) -> [Int] {
    var carry = 0
    var result = [Int]()
    for int in bigNumber.reversed() {
        let totalResult = number * int + carry
        carry = totalResult / 10
        result.append(totalResult % 10)
    }
    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }
    return result.reversed()
}

func mul(_ number1: [Int], by number2: [Int]) -> [Int] {
    var subresults = number2.reversed().reduce(into: [[Int]]()) { partialResult, int in
        partialResult.append(mul(number1, by: int))
    }
    subresults.indices.forEach { index in
        (0..<index).forEach { _ in subresults[index].append(0) }
    }
    var result = subresults[0]
    for subresult in subresults.dropFirst() {
        result = sum(result, subresult)
    }
    return result
}

func sum(_ int1: [Int], _ int2: [Int]) -> [Int] {
    var currentIndex = int1.count - 1
    var currentIndex2 = int2.count - 1
    var carry: Int = 0
    var result: [Int] = []
    while currentIndex >= 0 || currentIndex2 >= 0 {
        var currentTotalSum = carry
        if currentIndex >= 0 {
            currentTotalSum += int1[currentIndex]
        }
        if currentIndex2 >= 0 {
            currentTotalSum += int2[currentIndex2]
        }
        let currentSum = currentTotalSum % 10
        result.append(currentSum)
        carry = currentTotalSum / 10
        currentIndex -= 1
        currentIndex2 -= 1
    }
    if carry > 0 {
        result.append(carry)
    }
    return result.reversed()
}

func diff(_ int1: [Int], _ int2: [Int]) -> [Int] {
    guard int1 != int2 else { return [0] }
    guard int1.greaterThan(int2) else { return [-1] }
    var number1 = int1
    var number2 = int2
    while number2.count != number1.count {
        number2.insert(0, at: 0)
    }
    var result = [Int]()
    for index in number1.indices.reversed() {
        guard number1[index] < number2[index] else {
            result.insert(number1[index] - number2[index], at: 0)
            continue
        }
        for prevIndex in (0..<index).reversed() {
            guard number1[prevIndex] > 0 else { continue }
            number1[prevIndex] -= 1
            for i in (prevIndex + 1)..<index { number1[i] += 9 }
            number1[index] += 10
            break
        }
        result.insert(number1[index] - number2[index], at: 0)
    }
    while result.count > 1 && result[0] == 0 {
        result.remove(at: 0)
    }
    return result
}
