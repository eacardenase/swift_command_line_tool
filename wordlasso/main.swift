//
//  main.swift
//  wordlasso
//
//  Created by Edwin Cardenas on 5/14/25.
//

import Foundation

struct Wordlasso {
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
        
        if args.count > 1 {
            let template = args[1]
            
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

do {
    try Wordlasso().run()
} catch {
    fatalError("Program exited unexpectedly. \(error)")
}
