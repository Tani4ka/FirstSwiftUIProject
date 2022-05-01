//
//  ContextMenu.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 01.05.2022.
//

import SwiftUI

struct ContextMenu: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .frame(height: 300)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(30)
            .padding()
            .contextMenu {
                Button {
                    print("Copy")
                } label: {
                    HStack {
                        Image(systemName: "doc.on.doc")
                        Text("Copy")
                    }
                }
                
                Button {
                    print("Share")
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                }
            }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
