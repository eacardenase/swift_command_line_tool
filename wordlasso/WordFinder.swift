//
//  WordFinder.swift
//  wordlasso
//
//  Created by Edwin Cardenas on 5/15/25.
//

import Foundation

struct WordFinder {
    static let wildcard: Character = "."
    let wordList: [String]
    let ignoreCase: Bool
    
    init(wordListPath: String, ignoreCase: Bool) throws {
        let wordListContent = try String(contentsOfFile: wordListPath, encoding: .utf8)
        wordList = wordListContent.components(separatedBy: .newlines)
        
        self.ignoreCase = ignoreCase
    }
    
    private func caseCorrected(_ value: String) -> String {
        return ignoreCase ? value.lowercased() : value
    }
    
    private func isMatch(template: String, with word: String) -> Bool {
        guard template.count == word.count else { return false }
        
        return template.indices.allSatisfy { index in
            template[index] == Self.wildcard || template[index] == word[index]
        }
    }
    
    func findMatches(for template: String) -> [String] {
        #warning("Handle empty templates.")
        
        return wordList.filter { candidate in
            isMatch(template: caseCorrected(template),
                    with: caseCorrected(candidate))
        }
    }
}
