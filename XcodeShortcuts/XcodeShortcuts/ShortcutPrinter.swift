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
        print("=> \(shortcut.description): ", separator: "", terminator: "")
        let earlyReturn = printCountDown(duration: getTime())
        if !earlyReturn {
            print(shortcut.keys)
            print("Did you get the right answer? y/n")
        }
    }

    func printCountDown(duration amount: Int) -> Bool {
        var total = amount

        for _ in 0..<amount {
            print(". ", separator: "", terminator: "")
            Thread.sleep(forTimeInterval: 3)
            if stop {
                print()
                return true
            }
            total -= 1
        }
        print()
        return false
    }

    func getTime() -> Int {
        if shortcut.allTimeCorrect > 4 {
            return 4
        }
        return 8 - shortcut.correct
    }
}
