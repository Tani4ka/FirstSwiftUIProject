//
//  NavigationLinkSheet.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 17.04.2022.
//

import SwiftUI

/// Dog object - для идентификации каждый ряд списка
struct Dog: Identifiable {
    var id = UUID()
    var name: String
}

/// Rows for list
struct DogRow: View {
    var dog: Dog
    
    var body: some View {
        Text(dog.name)
    }
}

/// View для перехода  в списке
struct DogView: View {
    var dog: Dog
    
    var body: some View {
        Text("Come and choose a \(dog.name)")
            .font(.largeTitle)
    }
}

struct NavigationLinkSheet: View {
    
    @State private var selectedTab = 1
    @State private var showingDetail = false
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            /// Tab 1 - View with list
            let first = Dog(name: "Sobaka")
            let dogs = [first]
            
            NavigationView {
                List(dogs) { dog in
                    NavigationLink(destination: DogView(dog: dog)) {
                        DogRow(dog: dog)
                    }
                } .navigationBarTitle("Choose a dog")
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("List NavLink")
            } .tag(1)
            
            /// Tab 2 - NavigationLink view
            NavigationView {
                NavigationLink(destination: DetailView()) {
                    Text("Some new view with detail view")
                } .navigationBarTitle("Navigation")
            }
            .tabItem {
                Image(systemName: "2.square.fill")
                Text("NavigationLink")
            } .tag(2)
            
            /// Tab 3 - Sheet view
            Button(action: {
                self.showingDetail.toggle()
            }, label: {
                Text("Show sheet with detail")
            }) .sheet(isPresented: $showingDetail) {
                DetailView()
            }
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Sheet")
                } .tag(3)
        }
    }
}

/// Detail view for tab 2 and 3 
struct DetailView: View {
    // для кнопки back
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("This is the detail view")
        Button("Back") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

// Preview
struct NavigationLinkSheet_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationLinkSheet()
        NavigationLinkSheet()
    }
}
