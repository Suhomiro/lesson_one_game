//
//  Emoji.swift
//  lesson_one_game
//
//  Created by Midis on 20/06/2022.
//

import Foundation

class Emoji{
    var emojiCollection = ["😈", "🫦", "😈", "🫦", "🤙🏽", "🖕🏽", "🤙🏽", "🖕🏽", "💋", "💄", "💋", "💄", "♠️", "♣️", "♠️", "♣️", "♦️", "♥️", "♦️", "♥️"]
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
