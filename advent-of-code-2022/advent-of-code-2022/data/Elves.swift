//
//  Elves.swift
//  advent-of-code-2022
//
//  Created by Michael Craun on 12/5/22.
//

import Foundation


struct Elf {
    var totalCaloires: Int {
        var total = 0
        items.forEach({ total += $0 })
        return total
    }
    
    var items: [Int]
}
