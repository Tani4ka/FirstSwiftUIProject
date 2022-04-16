//
//  TabView&Form.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 11.04.2022.
//

import SwiftUI

struct TabViewCalcAlerts: View {
    /// Variables
    @State private var selectedView = 1
    // for calculator
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPersentage = 0
    // for alets
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false

    let tipPersentages = [0, 5, 10, 15, 20]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPersentages[tipPersentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amoumtPerPerson = grandTotal / peopleCount

        return amoumtPerPerson
    }

    /// TabView
    var body: some View {

        TabView(selection: $selectedView) {
            // Tab-1 Tip Calculator
            NavigationView {
                Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    Section(header: Text("How mutch tea do you want to live?")) {
                        Picker("Tip percentage", selection: $tipPersentage) {
                            ForEach(0..<tipPersentages.count) {
                                Text("\(self.tipPersentages[$0])%")
                            }
                        } .pickerStyle(SegmentedPickerStyle())
                    }
                    Section {
                        Text("\(totalPerPerson, specifier: "%.2f")")
                    }
                }.navigationBarTitle("Tip  calculator", displayMode: .inline)
            }
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calculator")
                }.tag(2)

            // Tab-2 Alerts
            VStack {
                Button("Show first Alert") {
                    self.showingAlert1 = true
                } .alert(isPresented: $showingAlert1) {
                    Alert(title: Text("FirstButton"),
                          message: Text("Some detail message"),
                          dismissButton: .default(Text("OK")))
                }
                .padding()

                Button("Show second Alert") {
                    self.showingAlert2 = true
                } .alert(isPresented: $showingAlert2, content: {
                    Alert(title: Text("Second button"),
                          message: nil,
                          dismissButton: .cancel())
                })
                .padding()

                Button {
                    self.showingAlert3 = true
                } label: {
                    Text("Show alet")
                } .alert(isPresented: $showingAlert3) {
                    Alert(title: Text("Are you sure want to delete this?"),
                          message: Text("There is no way back"),
                          primaryButton: .destructive(Text("Delete")) {
                        print("Deleted")
                    },
                          secondaryButton: .cancel())
                }
                .padding()

                Button {
                    self.showingAlert4 = true
                } label: {
                    Text("Show Action Sheets")
                } .actionSheet(isPresented: $showingAlert4) {
                    ActionSheet(title: Text("What do you want to do?"),
                                message: Text("Thereis only one choice..."),
                                buttons: [.default(Text("Dismiss Action Sheet")),
                                          .cancel(),
                                          .destructive(Text("Delete")) { print("Delete")
                                          } ])
                }
            }
            .tabItem {
                Image(systemName: "message")
                Text("Alerts")
            }.tag(1)
            // Tab-3 Groups
            VStack {
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }.background(Color.white)
                .tabItem {
                    Image(systemName: "tablecells")
                    Text("Groups")
                }.tag(3)

        }.background(Color.gray)
    }
}

struct TabViewFormPreviews: PreviewProvider {
    static var previews: some View {
        TabViewCalcAlerts()
    }
}
