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
                         Shortcut(description:"Add/Remove Split Windows", keys: "⇧ + ⌥ + ⌘ + ↩"),
                         Shortcut(description:"Jump to Method", keys: "⌃ + 6"),
                         Shortcut(description:"Go to Line", keys: "⌘ + l"),
                         Shortcut(description:"Switch Tabs", keys: "⇧ + ⌘ + }"),
                         Shortcut(description:"Open Call Hierarchy", keys: "⇧ + ⌃ + ⌘ + h"),
                         Shortcut(description:"Fix All Issues", keys: "⌃ + ⌥ + ⌘ + f"),
                         Shortcut(description:"Extract to method", keys: "⇧ + ⌥ + e"),
                         Shortcut(description:"Rename", keys: "⌥ r"),
                         Shortcut(description:"Authors", keys: "⌃ ⇧ ⌘ a"),
                         Shortcut(description:"Show Test Results", keys: "⌘ 6"),
                         Shortcut(description:"Show Report Navigator", keys: "⌘ 9"),
                         Shortcut(description:"Debugging - Step Over", keys: "fn F6"),
                         Shortcut(description:"Jump to Navigator", keys: "⇧ ⌘ j"),
]
var manager = ShortcutManager(shortcuts: shortcuts)
manager.go()
