//
//  ContentView.swift
//  MyFirstProject
//
//  Created by MacOS on 21.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
        let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 10, endRadius: 50)
        let angularGradient = AngularGradient(gradient: colors, center: .center)

        VStack(alignment: .center, spacing: 50) {
            HStack {
                Circle()
                    .fill(gradient)
                    .frame(width: 100, height: 100)
                Circle()
                    .strokeBorder(angularGradient, lineWidth: 15)
//                    .fill(angularGradient)
                    .frame(width: 100, height: 100)
            }

//            Spacer()
            VStack(spacing: 15) {
                //            Image("wheel")
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)

                Image(systemName: "cloud.sun.fill")
                    .font(.largeTitle)
                    .padding(30)
                    .background(Color.gray)
                    .foregroundColor(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Circle, Capsule

                Text("Hello wheel")
                    .padding()
                    .font(.largeTitle)
                    .background(
                        Image("wheel")
                            .resizable()
//                            .frame(width: 200, height: 100)
                    )
                    .foregroundColor(.black)

            }
//            Spacer()
            /// Text
            VStack(alignment: .center, spacing: 10) {
                Text("Let's style our text views with fonts, colors and line spacing")
                    .tracking(1) // kerning(5) - add space in the end
                    .padding(3)
                    .lineLimit(nil)
                    .truncationMode(.middle) // text....text
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                                        .lineSpacing(5)
                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom))

                Divider()

                Text("Hello, swift!")
                    .font(.body)
                    .padding(.vertical, 5)
                    .background(Color.yellow)
                    .padding()
                    .background(Color.red)
            }
//            Spacer()
        }
    }
}

/// Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
