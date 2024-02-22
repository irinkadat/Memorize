//
//  ContentView.swift
//  P1
//
//  Created by Irinka Datoshvili on 23.01.24.
//

import SwiftUI

struct ContentView: View {
    let emojis:[String] = ["👻","🫡","🥹","😻","😇","🥰","😎","😆","🤓","😋","😇","😻"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
            
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    var cards : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){

            ForEach(0..<cardCount, id: \.self){index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            
            }
          }
        }
    
    var cardCountAdjuster: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offSet:Int, symbol:String) -> some View {
        Button(action: {
            cardCount += offSet
            
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
    }
    
    
    var cardRemover : some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
        
    }
}
    
    struct CardView: View {
        let content: String
        @State var isFaceUp: Bool = true
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
    
    #Preview {
        ContentView()
    }

