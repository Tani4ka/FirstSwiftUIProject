//
//  Animation.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 22.04.2022.
//

import SwiftUI

struct Animation: View {
    @State private var selectedView = 1
    
    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1
    
    @State private var angle: Double = 0
    @State private var angle2: Double = 0
    @State private var borderThickness: CGFloat = 1
    @State private var showingWelcome = false
    @State private var opacity = 1.0
    @State private var text = "Hello"
    @State private var rotationRect = 0.0
    
    var body: some View {
        TabView(selection: $selectedView) {
            
            /// Tab - Transformation
            VStack {
                /// ScaleEffect
                Text("Scale effect")
                    .font(.subheadline)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .scaleEffect(1.5, anchor: .center)
                    .background(Color.orange)
                    .cornerRadius(20)
                //                .opacity(0.8)
                //                .blur(radius: 5)
                
                /// Rotation3DeEfect
                Text("Rotation 3D effect")
                    .font(.largeTitle)
                    .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                
                /// Rotation slider
                Slider(value: $rotation, in: 0...360, step: 1.0)
                Text("Rotation .topLeading")
                //                .rotationEffect(.radians(.pi)) // или (90)
                    .rotationEffect(.degrees(rotation), anchor: .topLeading)
                
                HStack {
                    Spacer()
                    Circle()
                    // border уходит полностью внутрь круга
                    //                .strokeBorder(Color.red, lineWidth: 5)
                    // половину рисует внутрь и половину наружу view
                    //                .stroke(Color.red, lineWidth: 5)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 5, dash: [10]))
                        .frame(width: 70, height: 70)
                    Spacer()
                    
                    Button {
                        print("Button tapped")
                    } label: {
                        Image(systemName: "cloud.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .clipShape(Circle()) // обрежит изображение
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Shadow")
                        .padding()
                        .border(Color.gray, width: 5)
                        .shadow(color: .gray, radius: 3, x: 10, y: 10)
                    
                    Spacer()
                    Text("Offset")
                        .offset(y: 15)
                        .padding()
                    //                .border(Color.red, width: 5)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.green, lineWidth: 5)
                        )
                    Spacer()
                }
                .padding()
                
                ZStack(alignment: .bottomTrailing) {
                    Image("Австралия")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorMultiply(.gray)
                    //                    .saturation(0.5)
                    //                    .contrast(0.5)
                    Text("This is offset in ZStack")
                        .background(Color.white)
                        .offset(x: -10, y: -15)
                }
            }
            .tabItem {
                Label("Rotation", systemImage: "list.dash")
            } .tag(2)
            
            /// Tab - Animation
            VStack {
                HStack {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rotationRect))
                        .animation(.easeInOut(duration: 3).delay(0.3), value: rotationRect)
                        .onTapGesture {
                            self.rotationRect += 360
                        }
                        .padding()
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .scaleEffect(scale)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                self.scale = 0.5
                            }
                        }
                }
                Button {
                    withAnimation(.linear(duration: 3)) {
                        self.opacity -= 0.4
                    }
                } label: {
                    Text("Opacity")
                        .padding()
                        .opacity(opacity)
                }

                Button {
                    self.scale += 1
                } label: {
                    Text("Scale")
                        .scaleEffect(scale)
                        .animation(.linear(duration: 5), value: scale)
                }
                .padding()
                Button {
                    self.angle += 45
                    self.borderThickness += 1
                } label: {
                    Text("Rotate")
                        .padding()
                        .border(Color.red, width: borderThickness)
                        .rotationEffect(.degrees(angle))
                        .animation(.easeIn, value: borderThickness)
                }
                .padding()
                Button {
                    self.angle2 += 45
                } label: {
                    Text("Spring") // пружинаи
                        .padding()
                        .rotationEffect(.degrees(angle2))
                        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 5), value: angle2)
                }
                .padding()
                VStack {
                    Toggle(isOn: $showingWelcome.animation()) {
                        Text("Toggle label")
                            .opacity(0.5)
                    }
                    if showingWelcome {
                        Text(self.text)
                            .opacity(opacity)
                            .foregroundColor(.orange)
                    }
                }
            }
               
            .tabItem {
                Label("Animation", systemImage: "square.and.pencil")
            } .tag(1)
        }
    }
}

/// Preview
struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
