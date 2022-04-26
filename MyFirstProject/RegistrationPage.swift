//
//  RegistrationPage.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 23.04.2022.
//

import SwiftUI

struct RegistrationPage: View {
    var body: some View {
        // GeometryReader - дочерние view будут подстраиваться под размер родителя
        GeometryReader { _ in
            VStack {
                Image(systemName: "signature")
                    .resizable()
                    .frame(width: 70, height: 70)
                ZStack {
                    Text("Hello, Swift")
                }
                HStack(spacing: 15) {
                    .fill(Color("Color1"))
                }
            }
        }
    }
}

struct RegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPage()
    }
}
