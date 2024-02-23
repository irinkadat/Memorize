//
//  EmojiMemoryGameView.swift
//  P1
//
//  Created by Irinka Datoshvili on 23.01.24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel : EmojiMemoryGame = EmojiMemoryGame()
    var body: some View {
       
        ScrollView{
            cards
        }
        .padding()
    }
    
    var cards : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){

            ForEach(viewModel.cards.indices, id: \.self){index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            
            }
          }        
        .foregroundColor(.orange)

        }
}
    struct CardView: View {
        var card : MemoryGame<String>.Card
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content).font(.largeTitle)
                }
                    .opacity(card.isFaceUp ? 1 : 0)
                base.fill()
                    .opacity(card.isFaceUp ? 0 : 1)
            }
//            .onTapGesture {
//                isFaceUp.toggle()
//            }
        }
    }
    
    #Preview {
        EmojiMemoryGameView()
    }

