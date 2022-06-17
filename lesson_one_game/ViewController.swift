//
//  ViewController.swift
//  lesson_one_game
//
//  Created by Midis on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Game(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchesLable.text = "Touches: \(touches)"
        }
    }
    
    let pinkColor = #colorLiteral(red: 1, green: 0.3017275698, blue: 0.7402455354, alpha: 1)
    let grayColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    let isMatchedColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0)
    var emojiCollection = ["😈", "🫦", "😈", "🫦", "🤙🏽", "🖕🏽", "🤙🏽", "🖕🏽", "💋", "💄", "💋", "💄", "♠️", "♣️", "♠️", "♣️", "♦️", "♥️", "♦️", "♥️"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomMathIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomMathIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }

    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = grayColor
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? isMatchedColor : pinkColor
            }
        }
    }
    
    @IBOutlet weak var touchesLable: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
 }

