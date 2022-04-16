//
//  StateToggle.swift
//  MyFirstProject
//
//  Created by MacOS on 22.02.2022.
//

/// Property Wrapper: @State

import SwiftUI

struct States: View {

    @State private var showHello = true
    @State private var showDetail = false
    @State private var name = ""
    @State private var password = ""
    @State private var celsius: Double = 0

    var colors = ["black", "white", "red", "green", "blue"]
    @State private var selectedColor = 0

    @State private var age = 18

    var body: some View {
        VStack(spacing: 20) {
            Divider()

            /// Tap on view
            HStack {
                Spacer()
                Text("View, tap me")
                    .padding(.vertical, 10)
                    .background(Color.yellow)
                    .onTapGesture(count: 2) {
                        print("Tapped on view twice")
                    }
                Spacer()
                Image("wheel")
                    .resizable()
                    .frame(width: 200, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .gesture(
//                        LongPressGesture(minimumDuration: 2)
//                            .onEnded({ _age in
//                                print("Long pressed gesture")
//                            })
                        DragGesture(minimumDistance: 50)
                            .onEnded({ _ in
                                print("Dragged gesture")
                            })
                    )
                Spacer()
            }
            .contentShape(Rectangle()) // HStack now tapable enywhere
            .onTapGesture {
                print("Hello views")
            }

            /// Toggle
            Divider()
            VStack {
                Toggle(isOn: $showHello,
                       label: {Text("Show Hello!")})
                    .padding(5)
                if showHello {
                    Text("Hello :)")
                        .background(Color.yellow)
                }
            }
            Divider()
            VStack {

                /// Button
                Button(action: {self.showDetail.toggle()},
                        label: {Text("Show details")})
                    .padding(10)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                if showDetail {
                    Text("Some details here...")
                        .font(.body)
                }
                Divider()

                /// Textfield
                HStack {
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Hello, \(name)")
                }
                HStack {
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("You entered: \(password)")
                }
                Divider()

                /// Slider
                Slider(value: $celsius, in: -100...100, step: 0.1)
                Text("\(celsius) Celsius is \(celsius * 9/5 + 32) Fahrenheit")
                Divider()

                /// Picker
                VStack {
                    Picker(selection: $selectedColor, label: Text("Choose a color")) {
                        ForEach(0..<colors.count) { index in
                            Text(self.colors[index])
                        }
                    }
//                    .pickerStyle(SegmentedPickerStyle())
                    Text("You selected: \(colors[selectedColor])")
                    Divider()

                    /// Stepper
//                    Stepper("Enter your age", value: $age, in: 0...130) or
                    Stepper("Enter your age", onIncrement: {
                        self.age += 1
                        print("Adding to age")
                    }, onDecrement: {
                        self.age -= 1
                        print("Substracting from age")
                    })
                    Text("Your age is \(age)")
                    Divider()

                    // Tap gesture
                    HStack {
                        Text("Tap me")
                            .onTapGesture {
                                print("Tapped!")
                            }
                    }.padding()
                }
            }
        }
    }
}

/// Canvas
struct StateToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            States()
        }
    }
}
