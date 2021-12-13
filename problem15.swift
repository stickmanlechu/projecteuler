//Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
//How many such routes are there through a 20×20 grid?

import Foundation

func routesInGrid(of size: Int, x: Int, y: Int) -> Int {
    if x == size || y == size { return 1 }
    return routesInGrid(of: size, x: x + 1, y: y) + routesInGrid(of: size, x: x, y: y + 1)
}

func fullPathsInGrid(of size: Int, x: Int, y: Int) -> [[(Int, Int)]] {
    if x == size && y == size { return [[(x, y)]] }
    var result = [[(Int, Int)]]()
    if x < size {
        result += fullPathsInGrid(of: size, x: x + 1, y: y)
    }
    if y < size {
        result += fullPathsInGrid(of: size, x: x, y: y + 1)
    }
    return result.map { $0 + [(x, y)] }
}

func prettyPrint(_ points: [(Int, Int)], forGridOfSize size: Int) {
    var grid = (0...size).map { _ in (0...size).map { _ in "◻" } }
    for point in points {
        grid[point.0][point.1] = "◼"
    }
    print(grid.map { $0.joined() }.joined(separator: "\n"))
}

// Pascal's triangle
extension Int {
    func chooseHalf() -> Int {
        let lower = (1...self/4).reduce(1, *)
        let upper = (self/2+1...self).enumerated().map { (offset, element) in offset % 2 == 0 ? element : 2 }.reduce(1, *)
        return upper / lower
    }
}

let start = CFAbsoluteTimeGetCurrent()

//print(routesInGrid(of: 20, x: 0, y: 0))
print(40.chooseHalf())

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
