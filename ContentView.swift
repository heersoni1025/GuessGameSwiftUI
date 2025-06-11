//
//  ContentView.swift
//  GuessGame



import SwiftUI

struct ContentView: View {
    
    @State var correctAnswer = 0
    
    @State var score = 0
    
    @State var gameTitle = "?"
    @State var gameSubtitle = ""


    
    var body: some View {
        VStack {
            VStack{
                //you can use group instead of VStack here
                Text(gameTitle).font(.system(size: 40,weight: .semibold))
           
            Text(gameSubtitle).font(.system(size: 20,weight: .semibold))
        }.frame(height:350)
            
            HStack{
                Spacer()
                Text("Score: \(score)").font(.system(size: 15, weight: .semibold))
                                
            }
 
            
            Button(action: {
                check(answer: 0)
                
            }, label:{
                Image("dog").frame(maxWidth: .infinity).frame(height: 50 ).background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Button(action: {
                check(answer: 1)
            }, label:{Image("cat").frame(maxWidth: .infinity).frame(height: 50 ).background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))})
            
            Button(action: {
                check(answer: 2)
                
            }, label:{Image("fox").frame(maxWidth: .infinity).frame(height: 50 ).background(Color.teal)
                .clipShape(RoundedRectangle(cornerRadius: 6))})

            Spacer()
        }
        .padding()
    }
    
    func check (answer : Int){
        if answer == correctAnswer{
            score += 1
            gameTitle = "Success!"
            
        }else{
            if score != 0 {
                score -= 1
                
            }
            gameTitle = "Failed!"
        }
        if correctAnswer == 0 {
            gameSubtitle = "Correct Answer is Dog"
        }
        else if correctAnswer == 1 {
            gameSubtitle = "Correct Answer is Cat"
            
        }else{
            gameSubtitle = "Correct Answer is Fox"
            
        }
        
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer(){
        let randomCorrectAnswer =  Int.random(in: 0..<3)
        
        correctAnswer = randomCorrectAnswer
    }
}

#Preview {
    ContentView()
}


// This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
//
//Copyright (c) 2024 Fullstacktuts LLC
//code was written by Heer Soni and several changes were made to improve design
