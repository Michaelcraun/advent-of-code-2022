//
//  RPS.swift
//  advent-of-code-2022
//
//  Created by Michael Craun on 12/5/22.
//

import Foundation

struct RockPaperScissors {
    let opponent: OpponentSelection
    let outcome: RoundStatus
    
    var response: Selection {
        return opponent.selection(for: outcome)
    }
    
    var pointValue: Int {
        return response.pointValueAgainst(opponent: opponent)
    }
    
    init?(line: String) {
        print(line)
        let components = line.components(separatedBy: " ")
        guard components.count == 2 else { return nil }
        
        opponent = OpponentSelection(rawValue: components[0])!
        outcome = RoundStatus(rawValue: components[1])!
    }
}

extension RockPaperScissors {
    enum RoundStatus: String {
        case lose = "X"
        case win = "Z"
        case draw = "Y"
        
        var pointValue: Int {
            switch self {
            case .lose: return 0
            case .draw: return 3
            case .win: return 6
            }
        }
    }
    
    enum OpponentSelection: String {
        case rock = "A"
        case paper = "B"
        case scissors = "C"
        
        func selection(for outcome: RoundStatus) -> Selection {
            switch self {
            case .rock:
                switch outcome {
                case .lose: return .scissors
                case .draw: return .rock
                case .win: return .paper
                }
            case .paper:
                switch outcome {
                case .lose: return .rock
                case .draw: return .paper
                case .win: return .scissors
                }
            case .scissors:
                switch outcome {
                case .lose: return .paper
                case .draw: return .scissors
                case .win: return .rock
                }
            }
        }
    }
    
    enum Selection: String {
        case rock = "X"
        case paper = "Y"
        case scissors = "Z"
        
        var pointValue: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissors: return 3
            }
        }
        
        func statusAgainst(opponent selection: OpponentSelection) -> RoundStatus {
            switch self {
            case .rock:
                switch selection {
                case .paper: return .lose
                case .scissors: return .win
                case .rock: return .draw
                }
            case .scissors:
                switch selection {
                case .paper: return .win
                case .scissors: return .draw
                case .rock: return .lose
                }
            case .paper:
                switch selection {
                case .paper: return .draw
                case .scissors: return .lose
                case .rock: return .win
                }
            }
        }
        
        func pointValueAgainst(opponent selection: OpponentSelection) -> Int {
            let status = statusAgainst(opponent: selection)
            return self.pointValue + statusAgainst(opponent: selection).pointValue
        }
    }
}
