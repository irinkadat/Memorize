//
//  ContentView.swift
//  P1
//
//  Created by Irinka Datoshvili on 23.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            
        }
        .padding()
        .font(.largeTitle)
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundColor(.orange)
                Text("👻").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}



#Preview {
    ContentView()
}
