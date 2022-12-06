//
//  Files.swift
//  advent-of-code-2022
//
//  Created by Michael Craun on 12/5/22.
//

import Foundation

struct Files {
    static let shared = Files()
    
    func load(file named: String, ext: String) -> String? {
        if let url = Bundle.main.url(forResource: named, withExtension: ext),
           let contents = try? String(contentsOf: url) {
            return contents
        }
        return nil
    }
    
    func linesFrom(file named: String, ext: String) -> [String] {
        if let fileContents = load(file: named, ext: ext) {
            return fileContents.components(separatedBy: "\n")
        }
        return []
    }
}
