//
//  List.swift
//  MyFirstProject
//
//  Created by MacOS on 23.02.2022.
//

import SwiftUI

struct TaskRow: View {
    var body: some View {
        Text("Some tasks")
    }
}

struct ListView: View {
    var body: some View {
        List {
            Section(header: Text("Header: Important tasks"),
                footer: Text("Footer: End")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
            Section(header: Text("Header: Other tasks")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }.listRowBackground(Color.yellow)
        } .listStyle(GroupedListStyle())
    }
}

/// Dynamic list
//
// struct Restaurant: Identifiable {
//    var id = UUID()
//    var name: String
// }
//
// struct RestaurantRaw: View {
//    var restaurant: Restaurant
//    var body: some View {
//        Text("Come and eat at \(restaurant.name)")
//    }
// }
//
// struct ListView: View {
//    var body: some View {
//            let first = Restaurant(name: "FirstRastaurant")
//            let second = Restaurant(name: "SecondRastaurant")
//            let third = Restaurant(name: "ThirdRastaurant")
//            let restaurants = [first, second, third]
//
//            List(restaurants) { restaurant in RestaurantRaw(restaurant: restaurant)
//        }
//    }
// }

/// Static list
// struct MusicRow: View {
//    var name: String
//
//    var body: some View {
//        Text("Music: \(name)")
//    }
// }
//
// struct ListView: View {
//    var body: some View {
//        List {
//            MusicRow(name: "Rock")
//            MusicRow(name: "Rap")
//            MusicRow(name: "Classical")
//        }
//    }
// }

/// Canvas
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
