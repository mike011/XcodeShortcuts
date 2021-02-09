//
//  SessionPrinter.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2021-01-01.
//

import Foundation

struct SessionPrinter {

    let shortcuts: [Shortcut]

    func printSummary(start: Date) {
        print("-------------------------------------------------")
        let totals = getTotals(for: shortcuts)
        print("Session Summary: ")
        print("\(totals.correct)/\(totals.total) for \(getPercentage(top: totals.correct, bottom: totals.total))%")

        let minutes = String(format: "%.0f", Date().timeIntervalSince(start) / 60)
        print("It took you \(minutes) minutes to complete.")

        print("All Total Summary: ")
        print("\(totals.allTimeCorrect)/\(totals.allTimeTotal) for \(getPercentage(top: totals.allTimeCorrect, bottom: totals.allTimeTotal))%")
        print("-------------------------------------------------")
    }

    func getPercentage(top: Int, bottom: Int) -> String {
        let percentage = Double(top) / Double(bottom) * 100.0
        return String(format: "%.2f", percentage)
    }

    func getTotals(for shortcuts: [Shortcut]) -> Shortcut {
        var correct = 0
        var total = 0
        var allTimeCorrect = 0
        var allTimeTotal = 0
        shortcuts.forEach { (shortcut) in
            correct += shortcut.correct
            total += shortcut.total
            allTimeCorrect += shortcut.allTimeCorrect
            allTimeTotal += shortcut.allTimeTotal
            shortcut.save()
        }

        var result = Shortcut(description: "", keys: "")
        result.correct = correct
        result.total = total
        result.allTimeCorrect = allTimeCorrect
        result.allTimeTotal = allTimeTotal
        return result
    }
}
