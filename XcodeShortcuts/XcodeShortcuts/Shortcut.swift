//
//  Shortcut.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2021-01-01.
//

import Foundation

struct Shortcut {
    let description: String
    let keys: String
    var correct = 0
    var total = 0
    var allTimeCorrect: Int
    var allTimeTotal: Int

    static fileprivate func getTotalKey(_ description: String) -> String {
        return description + "total"
    }

    static fileprivate func getCorrectKey(_ description: String) -> String {
        return description + "correct"
    }

    init(description: String, keys: String) {
        self.description = description
        self.keys = keys
        allTimeCorrect = UserDefaults.standard.integer(forKey: Self.getCorrectKey(description))
        allTimeTotal = UserDefaults.standard.integer(forKey: Self.getTotalKey(description))
    }

    func save() {
        UserDefaults.standard.setValue(allTimeCorrect + correct, forKey: Self.getCorrectKey(description))
        UserDefaults.standard.setValue(allTimeTotal + total, forKey: Self.getTotalKey(description))
    }

    func getTimesToAsk() -> Int {
        if allTimeTotal == 0 {
            return 3
        }
        if allTimeCorrect > 15 {
            return 1
        }

        if allTimeCorrect > 4 {
            return 2
        }
        return 1
    }

    mutating func answerQuestion(with answer: String?) {
        if answer?.lowercased().trimmingCharacters(in: .whitespaces) == "y" {
            print("Yes you did")
            correct += 1
        } else if correct > 0 {
            correct -= 1
        }
        total += 1
    }
}
