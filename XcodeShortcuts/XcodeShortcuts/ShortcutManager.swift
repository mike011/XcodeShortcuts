//
//  ShortcutManager.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2021-01-01.
//

import Foundation

public struct ShortcutManager {

    var session: Session

    init(shortcuts: [Shortcut]) {
        session = Session(shortcuts: shortcuts)
    }

    mutating func go() {
        session.askQuestions()
        session.printResults()
    }
}
