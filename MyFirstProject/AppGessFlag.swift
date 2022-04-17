//
//  AppGessFlag.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 15.04.2022.
//

import SwiftUI

struct AppGessFlag: View {
    
    @State private var countries = ["Египет", "Индия", "Бразилия", "Канада", "Греция", "Испания", "Италия", "Украина", "Япония", "США"].shuffled() // перемешать
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
                    Text("Выберите флаг: ")
                        .foregroundColor(.white)
                        .font(.title2)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.showingScore = true  // вызываем alert
                        self.flagTapped(number)   // ответ и какой счет
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
                Text("Общий счет: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Common score: \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func askQuestion() {
        countries.shuffle() // флаги перемешать
        correctAnswer = Int.random(in: 0...2) // выбрать новые страны
    }
    
    func flagTapped(_ number: Int) {

        if number == correctAnswer {
            scoreTitle = "Correct answer!"
            score += 1
        } else {
            scoreTitle = "Не правильно! Это флаг \(countries[number])"
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
