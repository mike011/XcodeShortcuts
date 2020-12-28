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
                 Shortcut(description:"Jump to Defintion", keys: "⌘ + ⌃ + j"),
                 Shortcut(description:"Jump to Editor", keys: "⌘ + j"),
                 Shortcut(description:"Jump to Console", keys: "⇧ + ⌘ + c"),
                 Shortcut(description:"Show Quick Help", keys: "⇧ + ⌃ + ⌘ + ?"),
                 Shortcut(description:"Show/Hide Debug Area", keys: "⇧ + ⌘ + y"),
                 Shortcut(description:"Show/Hide Navigator", keys: "⌘ + 0"),
                 Shortcut(description:"Show/Hide Inspector", keys: "⌥ + ⌘ + 0"),
                 Shortcut(description:"Show/Hide Console", keys: "⇧ + ⌘ + y"),
                ]

print("What is the keyboard combination for: ")
var x = 0

var shuffled = shortcuts.shuffled()
var answered = [Shortcut]()
while !shuffled.isEmpty {
    var shortcut = shuffled.removeFirst()
    print(shortcut.description + ": ", separator: "", terminator: "")
    printCountDown(from: 5)
    print(shortcut.keys)
    print("Did you get the right answer? y/n")
    let answer = readLine()
    if answer == "y" {
        shortcut.timesAnsweredCorrectly += 1
    }
    shortcut.timesAsked += 1

    answered.append(shortcut)
}

print(answered)

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

