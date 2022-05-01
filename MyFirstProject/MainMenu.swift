//
//  MainMenu.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 29.04.2022.
//

import SwiftUI

struct MainMenu: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("avatar")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    Text("Привет,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Яна")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    /// Button - Каталог
                    Button {
                        self.index = 0
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "book")
                                .foregroundColor(self.index == 0 ? Color("ColorMenu") : Color.white)
                            Text("Каталог")
                                .foregroundColor(self.index == 0 ? Color("ColorMenu") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("ColorMenu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    /// Button - Корзина
                    Button {
                        self.index = 1
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "cart")
                                .foregroundColor(self.index == 1 ? Color("ColorMenu") : Color.white)
                            Text("Корзина")
                                .foregroundColor(self.index == 1 ? Color("ColorMenu") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("ColorMenu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    /// Button - Избранное
                    Button {
                        self.index = 2
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "star")
                                .foregroundColor(self.index == 2 ? Color("ColorMenu") : Color.white)
                            Text("Избранное")
                                .foregroundColor(self.index == 2 ? Color("ColorMenu") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("ColorMenu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    /// Button - Мои заказы
                    Button {
                        self.index = 3
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "suitcase")
                                .foregroundColor(self.index == 3 ? Color("ColorMenu") : Color.white)
                            Text("Мои заказы")
                                .foregroundColor(self.index == 3 ? Color("ColorMenu") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color("ColorMenu").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    /// Button - Выйти
                    Button {
                        //
                    } label: {
                        HStack {
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .foregroundColor(.white)
                            Text("Выход")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
//            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .padding(.top, UIApplication.shared.connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.top)
            .padding(.top, UIApplication.shared.connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.bottom)
            
            /// Main screen
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    
                    Button {
                        withAnimation {
                            self.show.toggle()
                        }
                    } label: {
                        Image(systemName: self.show ? "xmark" : "line.3.horizontal")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18, alignment: .center)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    Text(self.index == 0 ? "Каталог" : (self.index == 1 ? "Корзина" : (self.index == 2 ? "Избранное" : "Мои заказы")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
//                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.top, UIApplication.shared.connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }?.safeAreaInsets.top)
                .padding()
                // GeometryReader - дочерние view будут подстраиваться под размер родителя
                GeometryReader { _ in
                    VStack {
                        if self.index == 0 {
                            Catalogue()
                        } else if self.index == 1 {
                            Card()
                        } else if self.index == 2 {
                            Fav()
                        } else {
                            Orders()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15: 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(Color.black).edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Catalogue: View {
    var body: some View {
        VStack {
            Text("Каталог")
        }
    }
}

struct Card: View {
    var body: some View {
        VStack {
            Text("Корзина")
        }
    }
}

struct Orders: View {
    var body: some View {
        VStack {
            Text("Мои заказы")
        }
    }
}

struct Fav: View {
    var body: some View {
        VStack {
            Text("Избранное")
        }
    }
}


/// Preview
struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .previewInterfaceOrientation(.portraitUpsideDown)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                       .previewDisplayName("iPhone 12")
    }
}
