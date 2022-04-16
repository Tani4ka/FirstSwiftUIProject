//
//  AppGessFlag.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 15.04.2022.
//

import SwiftUI

struct AppGessFlag: View {
     
    @State private var countries = ["Aрабские Эмираты", "Австралия", "Бразилия", "Канада", "Греция", "Испания", "Италия", "Украина", "Япония", "Сингапур"].shuffled() // перемешать
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Choose a flag: ")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }, label: {
                        Image(self.countries[number])
                            .resizable()
//                            .renderingMode(.original)
                            .frame(width: 250, height: 130)
//                            .clipShape(Capsule())
                            .overlay(Rectangle()
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                )}
                Text("Common score: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer()
                Text("Test text, need to remove").foregroundColor(Color.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Common score: \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct ancwer!"
            score += 1
        } else {
            scoreTitle = "Incorrect! This is a flag\(countries[number])"
            score -= 1
        }
    }
}

// Preview
struct AppGessFlag_Previews: PreviewProvider {
    static var previews: some View {
        AppGessFlag()
    }
}
