//
//  main.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2020-12-27.
//

import Foundation

struct Shortcut {
    let description: String
    let keys: String
    var timesAsked = 0
    var timesAnsweredCorrectly = 0
}

var shortcuts = [Shortcut(description:"Find", keys: "⌘ + f"),
                 Shortcut(description:"Replace", keys: "⌘ + ⌥ + f"),
                 Shortcut(description:"Jump to Defintion", keys: "⌃ + ⌘ + j"),
//                 Shortcut(description:"Go back", keys: "⌃ + ⌘ + ←"),
//                 Shortcut(description:"Jump to Editor", keys: "⌘ + j"),
//                 Shortcut(description:"Jump to Console", keys: "⇧ + ⌘ + c"),
//                 Shortcut(description:"Show Quick Help", keys: "⇧ + ⌃ + ⌘ + ?"),
//                 Shortcut(description:"Show/Hide Debug Area", keys: "⇧ + ⌘ + y"),
//                 Shortcut(description:"Show/Hide Navigator", keys: "⌘ + 0"),
//                 Shortcut(description:"Show/Hide Inspector", keys: "⌥ + ⌘ + 0"),
//                 Shortcut(description:"Show/Hide Console", keys: "⇧ + ⌘ + y"),
                ]

print("What is the keyboard combination for: ")
var x = 0

var shuffled = shortcuts.shuffled()
var answered = [Shortcut]()

let start = Date()
while !shuffled.isEmpty {
    var shortcut = shuffled.removeFirst()
    print(shortcut.description + ": ", separator: "", terminator: "")
    printCountDown(from: 8 - shortcut.timesAnsweredCorrectly)
    print(shortcut.keys)
    print("Did you get the right answer? y/n")

    let answer = readLine()
    if answer?.lowercased() == "y" {
        shortcut.timesAnsweredCorrectly += 1
    } else {
        shortcut.timesAnsweredCorrectly -= 1
    }

    shortcut.timesAsked += 1

    if shortcut.timesAnsweredCorrectly < 3 {
        shuffled.append(shortcut)
    } else {
        answered.append(shortcut)
    }
}

printSummary(for: answered)

func printSummary(for shortcuts: [Shortcut]) {
    let totals = getTotals(for: shortcuts)
    print("Summary: ")
    print("\(totals.0)/\(totals.1) for \(getPercentage(for: totals))%")

    print("It took you \(Date().timeIntervalSince(start)) to complete")
}

func getPercentage(for totals: (Int, Int)) -> String {
    let percentage = Double(totals.0) / Double(totals.1) * 100.0
    return String(format: "%.2f", percentage)
}

func getTotals(for shortcuts: [Shortcut]) -> (Int, Int) {
    var correct = 0
    var total = 0
    shortcuts.forEach { (shortcut) in
        correct += shortcut.timesAnsweredCorrectly
        total += shortcut.timesAsked
    }
    return (correct, total)
}

func printCountDown(from amount: Int) {
    var total = amount

    for _ in 0..<amount {
        print(". ", separator: "", terminator: "")
        do {
            sleep(1)
        }
        total -= 1
    }
}

