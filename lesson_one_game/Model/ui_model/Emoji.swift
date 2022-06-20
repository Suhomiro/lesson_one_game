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
            let randomMathIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomMathIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
}
