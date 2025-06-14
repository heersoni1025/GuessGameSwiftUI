//
//  ContentView.swift
//  GuessGame
//

import SwiftUI

struct Animal {
    let name: String
    let image: String
    let clue: String
    let fact: String
}

struct ContentView: View {
    
    @State private var correctAnswer = 0
    @State private var score = 0
    
    @State private var currentClue = ""
    @State private var gameTitle = "Guess the Animal!"
    @State private var gameSubtitle = ""
    
    let animalList: [Animal] = [
        Animal(name: "Dog", image: "dog", clue: "I bark and love to fetch balls.", fact: "Dogs can learn over 1000 words."),
        Animal(name: "Cat", image: "cat", clue: "I purr and love to nap all day.", fact: "Cats sleep up to 16 hours a day."),
        Animal(name: "Fox", image: "fox", clue: "I have a bushy tail and love forests.", fact: "Foxes can make over 40 different sounds.")
    ]
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Text(gameTitle)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text(currentClue)
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(gameSubtitle)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
            }
            .frame(height: 300)
            
            HStack {
                Spacer()
                Text("Score: \(score)")
                    .font(.system(size: 16, weight: .semibold))
            }
            
            ForEach(0..<animalList.count, id: \.self) { index in
                Button(action: {
                    check(answer: index)
                }, label: {
                    Image(animalList[index].image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(index == 0 ? Color.purple :
                                    index == 1 ? Color.blue :
                                    Color.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }

            Spacer()
        }
        .padding()
        .onAppear {
            randomizeQuestion()
        }
    }
    
    func check(answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameTitle = "Correct!"
            gameSubtitle = "✅ Fun Fact: \(animalList[answer].fact)"
        } else {
            if score > 0 { score -= 1 }
            gameTitle = "Oops!"
            gameSubtitle = "❌ Correct Answer: \(animalList[correctAnswer].name)\n💡 Fact: \(animalList[correctAnswer].fact)"
        }
        randomizeQuestion()
    }
    
    func randomizeQuestion() {
        correctAnswer = Int.random(in: 0..<animalList.count)
        currentClue = animalList[correctAnswer].clue
    }
}

#Preview {
    ContentView()
}

//
// This work is based on material from Fullstacktuts LLC, licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
// Code written and modified by Heer Soni in 2025 for personal learning. Several enhancements were made to improve gameplay and user experience.

