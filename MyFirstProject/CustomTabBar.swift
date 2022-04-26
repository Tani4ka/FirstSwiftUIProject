//
//  CustomTabBar.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 23.04.2022.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var selected = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Button {
                        self.selected = 0
                    } label: {
                        Image(systemName: "house.fill")
                    } .foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 1
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                    } .foregroundColor(self.selected == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 120)

                    Button {
                        self.selected = 2
                    } label: {
                        Image(systemName: "person.fill")
                    } .foregroundColor(self.selected == 2 ? .black : .gray)
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 3
                    } label: {
                        Image(systemName: "lineweight")
                    } .foregroundColor(self.selected == 3 ? .black : .gray)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())
                
                Button {
                    //
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.black)
                        .padding(18)
                }
                .background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
            }
        } .background(Color.green)
          .edgesIgnoringSafeArea(.all)
    }
}

struct CurvedShape: View {
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: 55), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 55))
        } .fill(Color.white)
          .rotationEffect(.init(degrees: 180))
    }
}

/// Previw
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
