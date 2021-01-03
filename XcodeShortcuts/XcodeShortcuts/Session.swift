//
//  Session.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2021-01-01.
//

import Foundation

struct Session {
    private let shortcuts: [Shortcut]
    private var answered = [Shortcut]()
    private let start = Date()

    init(shortcuts: [Shortcut]) {
        self.shortcuts = shortcuts
    }

    mutating func askQuestion() {
        print("What is the keyboard combination for: ")

        var shuffled = shortcuts.shuffled()

        while !shuffled.isEmpty {
            var shortcut = shuffled.removeFirst()

            let shortcutPrinter = ShortcutPrinter(shortcut: shortcut)
            shortcutPrinter.printTitle()

            shortcut.askQuestion()

            if shortcut.correct < shortcut.getTimesToAsk() {
                shuffled.append(shortcut)
            } else {
                answered.append(shortcut)
            }
        }
    }

    func printResults() {
        SessionPrinter(shortcuts: answered).printSummary(start: start)
    }
}
