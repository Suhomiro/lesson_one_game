//
//  Game.swift
//  lesson_one_game
//
//  Created by Midis on 17/06/2022.
//

import Foundation

class Game {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func choseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Need to more then one game card")//Only debug
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
        }
    }
}
