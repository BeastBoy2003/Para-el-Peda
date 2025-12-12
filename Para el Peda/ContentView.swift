//
//  ContentView.swift
//  Para el Peda
//
//  Created by Jacob Sanchez on 12/12/25.
//

import SwiftUI
import SwiftData

@main
struct Para_el_PedaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Optional: Custom color for dark blue
extension Color {
    static let darkBlue = Color(red: 0, green: 0, blue: 139/255)
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text("Para El Peda 🍻")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                NavigationLink(destination: GameSelectionView()) {
                    Text("Click to Play")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 40)
            }
            .padding()
        }
    }
}

// MARK: - Game Selection View
struct GameSelectionView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Select a Game Mode")
                .font(.title)
                .fontWeight(.semibold)
            
            NavigationLink(destination: CardGameView()) { // CardGameView in separate file
                Text("Card Game 🂠")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.darkBlue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            NavigationLink(destination: BoardGameView()) { // BoardGameView is here
                Text("Board Game 🎲")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

// MARK: - Placeholder Board Game View
struct BoardGameView: View {
    var body: some View {
        Text("Board Game Screen")
            .font(.largeTitle)
            .foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}
