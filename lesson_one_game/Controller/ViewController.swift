//
//  ViewController.swift
//  lesson_one_game
//
//  Created by Midis on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Game(numberOfPairsOfCards: numberOfPairsCard)
    
    var numberOfPairsCard: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) lazy var colors = Colors()
    private lazy var emoji = Emoji()
    
    private var touches = Count().touches {
        didSet{
            touchesLable.text = "Touches: \(touches)"
        }
    }

    private func updateViewFromModel() {
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
    
    @IBOutlet private weak var touchesLable: UILabel!
    
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    
    @IBOutlet private var buttonCollection: [UIButton]!
    
}


