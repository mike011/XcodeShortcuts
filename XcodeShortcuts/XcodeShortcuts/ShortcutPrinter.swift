//
//  ShortcutPrinter.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2021-01-01.
//

import Foundation

struct ShortcutPrinter {
    var shortcut: Shortcut
    var stop = false

    func printTitle() {
        print(shortcut.description + ": ", separator: "", terminator: "")
        printCountDown(duration: getTime())
        print(shortcut.keys)
        print("Did you get the right answer? y/n")
    }

    func printCountDown(duration amount: Int) {
        var total = amount

        for _ in 0..<amount {
            print(". ", separator: "", terminator: "")
            Thread.sleep(forTimeInterval: 1)
            if stop {
                return
            }
            total -= 1
        }
    }

    func getTime() -> Int {
        if shortcut.allTimeCorrect > 4 {
            return 4
        }
        return 8 - shortcut.correct
    }
}
