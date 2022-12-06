//
//  advent_of_code_2022Tests.swift
//  advent-of-code-2022Tests
//
//  Created by Michael Craun on 12/5/22.
//

import XCTest
@testable import advent_of_code_2022

final class advent_of_code_2022Tests: XCTestCase {
    func sortElvesByFattest() -> [Elf] {
        let lines = Files.shared.linesFrom(file: "calorie-counting", ext: "txt")
        var elves: [Elf] = []
        
        var currentElfCalories: [Int] = []
        for line in lines {
            if line == "" {
                let elf = Elf(items: currentElfCalories)
                elves.append(elf)
                currentElfCalories.removeAll()
                continue
            }
            
            if let calories = Int(line) {
                currentElfCalories.append(calories)
            }
        }
        
        let sortedByFatness = elves.sorted(by: { $0.totalCaloires > $1.totalCaloires })
        return sortedByFatness
    }
    
    func testFindElfWIthMostCalories() {
        let elves = sortElvesByFattest()
        guard let fattest = elves.first else { return XCTFail() }
        print(fattest.totalCaloires)
    }
    
    func testFindElvesWithMostCalories() {
        var elves = sortElvesByFattest()
        var totalCalories = 0
        
        for _ in 0...2 {
            let fattest = elves.removeFirst()
            totalCalories += fattest.totalCaloires
        }
        
        print(totalCalories)
    }
    
    func testCalculateRpsScore() {
        let lines = Files.shared.linesFrom(file: "rock-paper-scissors", ext: "txt")
        var totalScore = 0
        
        for line in lines where line != "" {
            guard let match = RockPaperScissors(line: line) else { return XCTFail() }
            totalScore += match.pointValue
        }
        
        print(totalScore)
    }
    
    func findDuplicateItems() -> [String] {
        let lines = Files.shared.linesFrom(file: "rucksacks", ext: "txt")
        print(lines)
        
        var rucksacks: [Rucksack] = []
        for line in lines where line != "" {
            if let rucksack = Rucksack(items: line) {
                rucksacks.append(rucksack)
            }
        }
        
        if lines.count != rucksacks.count { XCTFail() }
        
        print(rucksacks.count)
        
        return []
    }
    
    func testFindTotalPriority() {
        let _ = findDuplicateItems()
    }
}
