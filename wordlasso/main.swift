//
//  main.swift
//  wordlasso
//
//  Created by Edwin Cardenas on 5/14/25.
//

import Foundation

struct Wordlasso {
    func run() throws {
        let wordList = ["Wolf", "wolf", "word", "works", "woo"]
        let wordFinder = WordFinder(wordList: wordList, ignoreCase: true)
        
        let template = "wo.."
        let matches = wordFinder.findMatches(for: template)
        
        print("Found \(matches.count) \(matches.count == 1 ? "match" : "matches"):")
        
        for match in matches {
            print(match)
        }
    }
}

do {
    try Wordlasso().run()
} catch {
    fatalError("Program exited unexpectedly. \(error)")
}
