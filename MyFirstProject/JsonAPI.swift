//
//  JsonAPI.swift
//  MyFirstProject
//
//  Created by Tetiana Hranchenko on 30.04.2022.
//

import SwiftUI

struct JsonAPI: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack {
                    Text(post.title)
                        .fontWeight(.bold)
                    Text(post.body)
                }
            } .onAppear() {
                Api().getPost { (posts) in
                    self.posts = posts
                }
            } .navigationBarTitle("Posts")
        }
    }
}

/// Модель данных
struct Post: Codable, Identifiable {
//    var id = UUID()  // для элементов списка
    var id = 0
    var title: String
    var body: String
}

class Api {
    func getPost(completion: @escaping ([Post]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            if let posts = try? JSONDecoder().decode([Post].self, from: data!) {
                DispatchQueue.main.async {
                    completion(posts)
                }
                return
            }
        }
        .resume()
    }
}

/// Preview
struct JsonAPI_Previews: PreviewProvider {
    static var previews: some View {
        JsonAPI()
    }
}
