//
//  NavigTabViewList.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 09.04.2022.
//

import SwiftUI

struct NavigationViewForm: View {

    @State private var users = ["Ivan", "Maria", "Igor"]
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor = 0
    @State private var additionalSettings = false

    var body: some View {
        NavigationView {

            Form {
                Section(header: Text("Colors")) {
                    Picker(selection: $selectedColor, label:
                            Text("Select a color")) {
                        ForEach(0..<colors.count) {
                            Text(self.colors[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())

                    Toggle(isOn: $additionalSettings) {
                        Text("Additional settings")
                    }
                    Button {
                        print("This a form button")
                    } label: {
                        Text("Save changes")
                    }.disabled(!additionalSettings)

                }.navigationBarTitle("Settings")

                // List
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }.onDelete(perform: delete)
                        .onMove(perform: move)
                }
            }

            .navigationBarItems(leading: Button("Back") {
                print("Help tapped")
            },
                                trailing: EditButton())
            .navigationBarTitle("Welcome", displayMode: .inline)
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

struct NavigTabViewList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewForm()
    }
}
