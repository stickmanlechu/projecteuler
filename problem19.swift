// You are given the following information, but you may prefer to do some research for yourself.
//
// 1 Jan 1900 was a Monday.
// Thirty days has September,
// April, June and November.
// All the rest have thirty-one,
// Saving February alone,
// Which has twenty-eight, rain or shine.
// And on leap years, twenty-nine.
// A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
// How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

import Foundation

enum Weekday: Int, CaseIterable { case mon, tue, wed, thu, fri, sat, sun }
enum Month: Int, CaseIterable { case jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }
let leapYears = Set((1900...2000).filter { ($0 % 100 == 0 && $0 % 400 == 0) || ($0 % 100 != 0 && $0 % 4 == 0) })
extension Month {
    func days(in year: Int) -> Int {
        switch self {
        case .jan, .mar, .may, .jul, .aug, .oct, .dec: return 31
        case .apr, .jun, .sep, .nov: return 30
        case .feb: return leapYears.contains(year) ? 29 : 28
        }
    }
}

func solve() {
    var currentWeekday = Weekday.mon
    var currentYear = 1900
    var currentMonth = Month.jan
    var sundays = 0
    repeat {
        let days = currentMonth.days(in: currentYear)
        currentWeekday = Weekday.allCases[(currentWeekday.rawValue + days) % 7]
        currentMonth = Month.allCases[(currentMonth.rawValue + 1) % 12]
        if currentMonth == .jan { currentYear += 1 }
        if currentWeekday == .sun && currentYear > 1900 { sundays += 1 }
    } while !(currentYear == 2000 && currentMonth == .dec)
    print(sundays)
}

let start = CFAbsoluteTimeGetCurrent()

solve()

let diff = CFAbsoluteTimeGetCurrent() - start
print("\(#function) Took \(diff) seconds")


