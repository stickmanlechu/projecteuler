// https://projecteuler.net/problem=54

import Foundation

struct Card {
    let value: Int
    let color: Character
    
    init(_ str: String) {
        let card = Array(str)
        let chars: [Character] = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
        self.value = chars.firstIndex(of: card[0])! + 2
        self.color = card[1]
    }
}

enum Hand: Comparable {
    case high(Int)
    case onePair(Int, otherHighest: Int)
    case twoPairs(Int, Int, otherHighest: Int)
    case three(Int, otherHighest: Int)
    case straight(Int)
    case flush(Int)
    case full(three: Int, pair: Int)
    case four(Int, otherHighest: Int)
    case straightFlush(Int)
    case royal
    
    static func with(_ cards: [Card]) -> Self {
        let straightCheck = Set(cards.map(\.value).sorted(by: >).enumerated().map { $0.element + $0.offset })
        if straightCheck.count == 1 {
            let max = cards.map(\.value).max()!
            let oneColor = Set(cards.map(\.color)).count == 1
            return oneColor ? (max == 14 ? .royal : .straightFlush(max)) : .straight(max)
        }
        let countedCards = NSCountedSet(array: cards.map(\.value))
        let cardCount = Set(cards.map(\.value)).map { ($0, countedCards.count(for: $0)) }.sorted(by: { $0.1 > $1.1 })
        if cardCount[0].1 == 4 {
            return .four(cardCount[0].0, otherHighest: cardCount[1].0)
        }
        if cardCount[0].1 == 3 && cardCount[1].1 == 2 {
            return .full(three: cardCount[0].0, pair: cardCount[1].0)
        }
        if Set(cards.map(\.color)).count == 1 {
            return .flush(cards.map(\.value).max()!)
        }
        if cardCount[0].1 == 3 {
            return .three(cardCount[0].0, otherHighest: cards.map(\.value).filter { $0 != cardCount[0].0 }.max()!)
        }
        if cardCount[0].1 == 2 && cardCount[1].1 == 2 {
            let sortedPairs = [cardCount[0].0, cardCount[1].0].sorted(by: >)
            return .twoPairs(sortedPairs[0], sortedPairs[1], otherHighest: cards.map(\.value).filter { !sortedPairs.contains($0) }.max()!)
        }
        if cardCount[0].1 == 2 {
            return .onePair(cardCount[0].0, otherHighest: cards.map(\.value).filter { $0 != cardCount[0].0 }.max()!)
        }
        return .high(cards.map(\.value).max()!)
    }
}

func parse(_ line: String) -> (Hand, Hand) {
    let allCards = line.components(separatedBy: " ").map(Card.init)
    let h1 = Hand.with(Array(allCards[0...4]))
    let h2 = Hand.with(Array(allCards[5...9]))
    return (h1, h2)
}

let url = URL(string: "https://projecteuler.net/project/resources/p054_poker.txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!
let hands = input
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map(parse)

let start = CFAbsoluteTimeGetCurrent()

let p1Wins = hands
    .filter { $0 > $1 }
    .count
print(p1Wins)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")
