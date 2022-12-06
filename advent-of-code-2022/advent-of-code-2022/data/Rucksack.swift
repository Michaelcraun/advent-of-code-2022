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
    
    var overlappingItem: String? {
        var mutableCompartment = leftCompartment
        for _ in 0..<leftCompartment.count {
            let character = mutableCompartment.removeFirst()
            if rightCompartment.contains("\(character)") {
                print("Stupid elf packed 2 \(character)'s in \(leftCompartment) and \(rightCompartment)...")
                return "\(character)"
            }
        }
        return nil
    }
    
    var priorityValueOfOverlappingItem: Int {
        guard let overlappingItem = overlappingItem else { return 0 }
        let lowValues = ".abcdefghijklmnopqrstuvwxyz"
        let highValues = ".ABCEDFGHIJKLMNOPQRSTUVWXYZ"
        if lowValues.contains(overlappingItem) {
            return lowValues.distance(of: Character(overlappingItem)) ?? 0
        }
        
        if highValues.contains(overlappingItem) {
            return (highValues.distance(of: Character(overlappingItem)) ?? 0) + 26
        }
        
        return 0
    }
    
    init?(items: String) {
        var mutableItems = items
        var left = ""
        for _ in 0..<(items.count / 2) {
            left += "\(mutableItems.removeFirst())"
        }
        
        leftCompartment = left
        rightCompartment = mutableItems
        
        if leftCompartment.count != rightCompartment.count {
            print("left lenght != right length [\(leftCompartment.count) != \(rightCompartment.count)]")
            return nil
        }
        
        if leftCompartment.count + rightCompartment.count != items.count {
            print("count mismatch")
            return nil
        }
    }
}

extension StringProtocol {
    func distance(of element: Element) -> Int? { firstIndex(of: element)?.distance(in: self) }
    func distance<S: StringProtocol>(of string: S) -> Int? { range(of: string)?.lowerBound.distance(in: self) }
}

extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}

extension String.Index {
    func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self) }
}
