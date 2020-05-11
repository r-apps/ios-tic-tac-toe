//
//  ContentView.swift
//  game-tic-tac-toe
//
//  Created by Ruben Vitt on 20.02.20.
//  Copyright © 2020 Rubeen. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    var game: Game = Game()
    var body: some View {
        VStack {
            VStack {
                ForEach(game.fields, id: \.self) { row in
                    HStack {
                        ForEach(row) { field in
                            Button(action: {
                                
                            }) {
                                Text(field.state.rawValue)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct RowValue: View {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
