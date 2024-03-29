//
//  P1App.swift
//  P1
//
//  Created by Irinka Datoshvili on 23.01.24.
//

import SwiftUI
@main
struct P1App: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
