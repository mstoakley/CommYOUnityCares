//
//  HomeView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 4/5/24.
//
import SwiftUI

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    var content: String
    var image: Image?  // SwiftUI Image type
    var likes: Int
}


let posts = [
    Post(content: "Made new friends at Keep Waller Green!", image: Image("communityvol"), likes: 128),
    Post(content: "Hello CommYOUnity Cares!!!", likes: 89),
    Post(content: "PV we need your help this Saturday!!", image: Image("poster"), likes: 104),
    // Add more posts here...
]

struct HomeView: View {
    @State private var posts: [Post] = [
        Post(content: "Made new friends at Keep Waller Green!", image: Image("communityvol"), likes: 128),
        Post(content: "Hello CommYOUnity Cares!!!", likes: 89),
        Post(content: "PV we need your help this Saturday!!", image: Image("poster"), likes: 104),
    ]
    
    @State private var newPostContent = ""
    @State private var newPostImageName = ""

    var body: some View {
        VStack {
            // New post input area
            HStack {
                TextField("New post content", text: $newPostContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Image name", text: $newPostImageName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Post") {
                    addNewPost()
                }
            }.padding()
            
            // Posts List
            List(posts) { post in
                VStack(alignment: .leading, spacing: 10) {
                    if let image = post.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    Text(post.content)
                        .font(.body)
                    HStack {
                        Button(action: { func incrementLikes(for postId: UUID) {
                            if let index = posts.firstIndex(where: { $0.id == postId }) {
                                posts[index].likes += 1
                            }
                        }
                         
                        }) {
                            Image(systemName: "heart")
                            Text("\(post.likes)")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .listStyle(PlainListStyle()) // Removes default List dividers
        }
    }

    func addNewPost() {
        let image = newPostImageName.isEmpty ? nil : Image(newPostImageName)
        let newPost = Post(content: newPostContent, image: image, likes: 0)
        posts.insert(newPost, at: 0)
        newPostContent = ""
        newPostImageName = ""
    }

}

#Preview {
    HomeView()
}



