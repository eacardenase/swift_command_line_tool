//
//  main.swift
//  wordlasso
//
//  Created by Edwin Cardenas on 5/14/25.
//

import Foundation
import ArgumentParser

struct Wordlasso: ParsableCommand {
    @Argument(help: """
        The word template to match, with \(WordFinder.wildcard) as \
        placeholders. Leaving this blank will enter interactive mode.
        """)
    var template: String?
    
    private func findAndPrintMatches(for template: String, using wordFinder: WordFinder) {
        let matches = wordFinder.findMatches(for: template)
        
        print("Found \(matches.count) \(matches.count == 1 ? "match" : "matches"):")
        
        for match in matches {
            print(match)
        }
    }
    
    func run() throws {
        let path = "/usr/share/dict/words"
        let wordFinder = try WordFinder(wordListPath: path, ignoreCase: true)
        
        let args = CommandLine.arguments
        print("Command-line arguments:", args)
        
        if let template = template {
            findAndPrintMatches(for: template, using: wordFinder)
        } else {
            while true {
                print("Enter word template: ", terminator: "")
                
                guard let template = readLine(), !template.isEmpty else { return }
                
                findAndPrintMatches(for: template, using: wordFinder)
            }
        }
    }
}

Wordlasso.main()
