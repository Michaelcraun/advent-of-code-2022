//
//  Rucksack.swift
//  advent-of-code-2022
//
//  Created by Michael Craun on 12/5/22.
//

import Foundation

struct Rucksack {
    let leftCompartment: String
    let rightCompartment: String
    
    init?(items: String) {
        var mutableItems = items
        var left = ""
        for _ in 0..<(items.count / 2) {
            left += "\(mutableItems.removeFirst())"
        }
        
        leftCompartment = left
        rightCompartment = mutableItems
        
        if leftCompartment.count != rightCompartment.count {
            return nil
        }
    }
}
