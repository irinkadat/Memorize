//
//  MemorizeGame.swift
//  P1
//
//  Created by Irinka Datoshvili on 22.02.24.
//

// this is our model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards:Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content,id: "\(pairIndex+1)b"))

        }
    }
    
    func choose(_ card:Card){
 
    }
    
    mutating func shuffle(){
        cards.shuffle()
        
    }

    struct Card:Equatable, Identifiable{
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
        
        var isFaceUp = true
        var isMatched = false
        var content : CardContent
        
        var id: String

    }
}
