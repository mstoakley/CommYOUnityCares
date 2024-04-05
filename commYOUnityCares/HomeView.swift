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
    Post(content: "Just visited the Eiffel Tower!", image: Image("communityvol"), likes: 128),
    Post(content: "Hello SwiftUI!", likes: 89),
    //Post(content: "Check out my new skateboard", image: "skateboard", likes: 104),
    // Add more posts here...
]

struct HomeView: View {
    @State private var posts: [Post] = [
        // Initial posts...
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
                    if let imageName = post.image, !imageName.isEmpty {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    }
                    Text(post.content)
                        .font(.body)
                    HStack {
                        Button(action: {
                            // Handle like button action here, e.g., incrementing likes
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
        let newPost = Post(content: newPostContent, image: newPostImageName.isEmpty ? nil : newPostImageName, likes: 0)
        posts.insert(newPost, at: 0) // Inserts new post at the beginning of the list
        newPostContent = "" // Clears the text field content
        newPostImageName = "" // Clears the image name field
    }
}




