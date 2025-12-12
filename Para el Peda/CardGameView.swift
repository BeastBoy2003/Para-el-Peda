//
//  CardGameView.swift
//  Para el Peda
//
//  Created by Jacob Sanchez on 12/12/25.
//

import SwiftUI

struct CardGameView: View {
    @State private var deck = sampleDeck.shuffled()
    @State private var currentCard: Card? = nil
    @State private var showAddCardPrompt = true
    @State private var customCardText = ""
    @State private var customCards: [Card] = []

    var body: some View {
        VStack(spacing: 40) {
            Text("Card Game 🂠")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black) // header in black

            if let card = currentCard {
                Text(card.text)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil) // allow multiple lines
                    .minimumScaleFactor(0.5)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .foregroundColor(.black) // questions in black
            } else {
                Text("Click 'Draw Next Card' to start! 🎉")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .foregroundColor(.black) // placeholder in black
            }

            Button(action: drawNextCard) {
                Text("Draw Next Card")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(red: 0.9, green: 0.95, blue: 1))
        .navigationTitle("Card Game")
        .sheet(isPresented: $showAddCardPrompt) {
            VStack(spacing: 20) {
                Text("Add Custom Cards")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                TextField("Enter a custom question", text: $customCardText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                HStack(spacing: 20) {
                    Button("Add Another") {
                        if !customCardText.isEmpty {
                            customCards.append(Card(text: customCardText))
                            customCardText = ""
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Start Game") {
                        if !customCardText.isEmpty {
                            customCards.append(Card(text: customCardText))
                        }
                        deck.append(contentsOf: customCards)
                        deck.shuffle()
                        showAddCardPrompt = false
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }

    func drawNextCard() {
        guard !deck.isEmpty else {
            deck = sampleDeck.shuffled()
            return
        }
        let randomIndex = Int.random(in: 0..<deck.count)
        currentCard = deck[randomIndex]
        deck.remove(at: randomIndex)
    }
}

// Sample deck
let sampleDeck: [Card] = [
    Card(text: "Take 1 shot 🍺"),
    Card(text: "Whoever is wearing green drinks! 🍹"),
    Card(text: "If you’ve slept with anyone this week, drink! 🥂"),
    Card(text: "Busted a nut in the last 3 days? Take a sip! 😏"),
    Card(text: "Everyone who has ever been called toxico/toxica, drink two times"),
    Card(text: "Send your boss/manager a selfie with the group or finish your drink"),
    Card(text: "Smell each player's armpits or drink twice. The player with the worst smelling pits also drinks twice"),
    Card(text: "Everyone whose parents ever told them, 'Veras cuando lleguemos a la casa,' drink two times"),
    Card(text: "Everyone whose mom used VapoRub on them, take a drink"),
    Card(text: "Hit the oldest person in the group with a chancla. Do this, take a shot, or quit playing"),
    Card(text: "If your second toe is longer than your big toe, take a shot"),
    Card(text: "Do a cartwheel or take a shot"),
    Card(text: "If you ever made out with a coworker before, take a shot"),
    Card(text: "Comment 😍 on your ex's most recent post or finish finish your drink and take a shot"),
    Card(text: "Make a drink with whatever y'all have and choose someone to drink it, you also have to drink it yourself"),
    Card(text: "Vote whoever is the most likely to throw up after drinking, they have to take a shot"),
    Card(text: "Vote whoever is most likely to pull a girl/boy after going out, they have to finish their drink"),
    Card(text: "Vote who can handle their alcohol, they have to finish their drink and take a shot"),
    Card(text: "Vote who's most likely to kiss everyone in the friend group, take a shot, if there's no winner then everyone takes 2 shots"),
]


// Card model
struct Card: Identifiable {
    let id = UUID()
    let text: String
}

#Preview {
    CardGameView()
}
