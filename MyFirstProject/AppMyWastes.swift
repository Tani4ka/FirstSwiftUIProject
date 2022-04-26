//
//  AppMyWastes.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 19.04.2022.
//

import SwiftUI

/// Одна затрата
struct ExpenseItem: Identifiable, Codable {
    var id = UUID() // уникальный идентификатор для каждой строки в 16-тиричной системе исчисления, нужен Identifiable
    let name: String
    let type: String
    let amount: Int
}

/// Для хранения массива затрат: UserDefaults, Decode, Encode
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder() 
            if let encoded = try? encoder.encode(items) {
                Foundation.UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = Foundation.UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

struct AppMyWastes: View {
    @State private var showingAddExpense = false // для sheet
    @ObservedObject var expenses = Expenses() // просим swift наблюдать за изменениями экземпляра класса expenses и обновлять view при изменеиях
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Мои расходы")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true // будет переход на другое view
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddExpense) {
                    AddWastesView(expenses: self.expenses)
                }
            )}
    }
    
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

/// Preview
struct AppMyWastes_Previews: PreviewProvider {
    static var previews: some View {
        AppMyWastes()
    }
}
