//
//  Card.swift
//  lesson_one_game
//
//  Created by Midis on 17/06/2022.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init(){
        self.identifier = Card.identifierGenerator()
    }
}
