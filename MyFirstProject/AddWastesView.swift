//
//  AddWastesView.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 19.04.2022.
//

import SwiftUI

struct AddWastesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses // для отслеживания изменений
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Busines", "Personal"]
    
    var body: some View {
            NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Стоимость", text: $amount)
                    .keyboardType(.numberPad) // клавиатура с цыфрамии
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems(trailing: Button("Сохранить") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

/// Preview
struct AddWastesView_Previews: PreviewProvider {
    static var previews: some View {
        AddWastesView(expenses: Expenses())
    }
}
