//
//  Sign.swift
//  RPS
//
//  Created by Azamat Yelubay on 6/20/20.
//  Copyright © 2020 Azamat. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign==0{
        return .rock
    }
    else if sign == 1{
        return .paper
    }
    else{
        return .scissors
    }
}

enum Sign {
    case rock, paper , scissors
    var emoji: String{
        switch self {
        case .paper:
            return "👋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    func takeTurn (for oposite: Sign) -> GameState {
        switch self {
        case .rock:
            switch oposite {
            case .rock: return .draw
            case .paper: return .lose
            case .scissors :return .win
            }
        case .paper:
            switch oposite {
                case .rock: return .win
                case .paper: return .draw
                case .scissors :return .lose
            }
        case .scissors:
            switch oposite {
                case .rock: return .lose
                case .paper: return .win
                case .scissors :return .draw
            }
        }
    }
}
