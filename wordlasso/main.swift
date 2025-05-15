//
//  main.swift
//  wordlasso
//
//  Created by Edwin Cardenas on 5/14/25.
//

import Foundation

struct Wordlasso {
    func run() throws {
        let path = "/usr/share/dict/words"
        let wordFinder = try WordFinder(wordListPath: path, ignoreCase: true)
        
        let args = CommandLine.arguments
        print("Command-line arguments:", args)
        
        let template: String
        
        if args.count > 1 {
            template = args[1]
        } else {
            print("Enter word template: ", terminator: "")
            
            template = readLine() ?? ""
        }
        
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
