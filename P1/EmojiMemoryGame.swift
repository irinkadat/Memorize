//
//  EmojiMemoryGame.swift
//  P1
//
//  Created by Irinka Datoshvili on 22.02.24.
//

// this is our ViewModel

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    
    private static let emojis  = ["👻","🙋‍♀️","🥹","😻","😇","🥰","😎","😆","🤓","😋","😇","😻"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 8) {pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]

            }else{
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()

    
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card : MemoryGame<String>.Card){
        model.choose(card)
    }
}
