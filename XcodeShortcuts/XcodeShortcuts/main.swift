//
//  main.swift
//  XcodeShortcuts
//
//  Created by Michael Charland on 2020-12-27.
//

import Foundation

private let shortcuts = [Shortcut(description:"Find", keys: "⌘ + f"),
                         Shortcut(description:"Replace", keys: "⌘ + ⌥ + f"),
                         Shortcut(description:"Jump to Defintion", keys: "⌃ + ⌘ + j"),
                         Shortcut(description:"Go back", keys: "⌃ + ⌘ + ←"),
                         Shortcut(description:"Jump to Editor", keys: "⌘ + j"),
                         Shortcut(description:"Jump to Console", keys: "⇧ + ⌘ + c"),
                         Shortcut(description:"Show Quick Help", keys: "⇧ + ⌃ + ⌘ + ?"),
                         Shortcut(description:"Show/Hide Debug Area", keys: "⇧ + ⌘ + y"),
                         Shortcut(description:"Show/Hide Navigator", keys: "⌘ + 0"),
                         Shortcut(description:"Show/Hide Inspector", keys: "⌥ + ⌘ + 0"),
                         Shortcut(description:"Fix All Issues", keys: "⌃ + ⌥ + ⌘ + f"),]
var manager = ShortcutManager(shortcuts: shortcuts)
manager.go()
