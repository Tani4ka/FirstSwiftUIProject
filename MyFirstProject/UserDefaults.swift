//
//  UserDefaults.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 18.04.2022.
//

import Foundation
import SwiftUI


/// Codable - зашифрует данные в формат JSON
struct User: Codable {
    var firstName: String
    var secondName: String
}


/// UserDefaults - для хранения настроек пользователя, последних действий...
struct UserDefaults: View {

    @State private var tapCount = Foundation.UserDefaults.standard.integer(forKey: "Tap")
    @State private var user = User(firstName: "Ivan", secondName: "Petrov")

    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                self.tapCount += 1
                Foundation.UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }
            .padding()
            
            Button("Save user data") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user) {
                    Foundation.UserDefaults.standard.set(data, forKey: "UserData")
                    
                    print(String(data: data, encoding: .utf8)!)
                }
                
                
            }
        }
    }
}


/// Preview
struct UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaults()
    }
}
