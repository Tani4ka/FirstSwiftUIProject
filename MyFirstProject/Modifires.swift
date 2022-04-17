//
//  Modifires.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 17.04.2022.
//

import SwiftUI

// Custom text
struct CustomText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .padding(5)
            .foregroundColor(.red)
            .background(Color.green)
    }
}

// Custom modifier
struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.red)
            .background(Color.green)
    }
}

// Extension
extension View {
    func customM() -> some View {
        self.modifier(CustomModifier())
    }
}

struct Modifires: View {
    @State private var useGreenText = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            CustomText(name: "First")
            CustomText(name: "Second")
            
            Text("Hello SwiftUI").modifier(CustomModifier())
            Text("Hello SwiftUI").customM()
            
            
//            Text("First")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.red)
//                .background(Color.green)

            Button(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) {
                self.useGreenText.toggle()
            } .foregroundColor(useGreenText ? .green : .blue)
        }
        
    }
}

struct Modifires_Previews: PreviewProvider {
    static var previews: some View {
        Modifires()
    }
}
