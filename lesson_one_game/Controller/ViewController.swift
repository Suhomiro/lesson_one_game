//
//  ViewController.swift
//  lesson_one_game
//
//  Created by Midis on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Game(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    lazy var colors = Colors()
    lazy var emoji = Emoji()
    
    var touches = Count().touches {
        didSet{
            touchesLable.text = "Touches: \(touches)"
        }
    }

    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji.emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = colors.grayColor
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? colors.isMatchedColor : colors.pinkColor
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

