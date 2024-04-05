//
//  HomeView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 4/5/24.
//
import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    var icon: Image?
    var title: String?
    var content: String
    var image: Image?  // SwiftUI Image type
    var likes: Int
    var comments: Int
    
}

struct HomeView: View {
    @State private var posts: [Post] = [
        Post(icon: Image(systemName: "pin") , title: "Welcome to the CommYOUnity", content: "Hello CommYOUnity Cares!!! Welcome to our app where our goal is to spread the message that your Community cares about YOU by allowing people the oppurtunity to help out where they can and speak up when they need it!", likes: 89, comments: 7),
        Post(title: "Keep Waller Green", content: "Made new friends at Keep Waller Green! Come out next weekend to the Waller County Community Center.", image: Image("communityvol"), likes: 128, comments: 4),
        Post(content: "PV we need your help this Saturday!!", image: Image("poster"), likes: 104, comments: 2),
    ]
    
    @State private var showingNewPostView = false // To control the presentation of the NewPostView
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        if let icon = post.icon {
                            icon
                        }
                        if let title = post.title {
                            Text(title)
                                .font(.headline)
                    }
                    }
                    if let image = post.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    Text(post.content)
                        .font(.body)
                    
                    HStack {
                        Button(action: {
                            incrementLikes(for: post.id)
                        }) {
                            Image(systemName: "heart")
                            Text("\(post.likes)")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer() // Space between buttons
                        
                        Button(action: {
                            incrementComments(for: post.id)
                        }) {
                            Image(systemName: "message")
                            Text("\(post.comments)")
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
            .listStyle(PlainListStyle())
            .navigationBarTitle("Posts", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                showingNewPostView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingNewPostView) {
                NewPostView(posts: $posts)
            }
        }
    }
    
    func incrementLikes(for postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].likes += 1
        }
    }
    
    func incrementComments(for postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].comments += 1
        }
    }
}

struct NewPostView: View {
    @Binding var posts: [Post] // Binding to the posts array from the parent view
    @Environment(\.dismiss) var dismiss // To dismiss the sheet
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var imageName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Content", text: $content)
                TextField("Image Name (optional)", text: $imageName)
                
                Button("Add Post") {
                    let newPost = Post(title: title.isEmpty ? nil : title, content: content, image: imageName.isEmpty ? nil : Image(imageName), likes: 0, comments: 0)
                    posts.insert(newPost, at: 0)
                    dismiss()
                }
                .disabled(content.isEmpty)
            }
            .navigationTitle("New Post")
            .navigationBarItems(leading: Button("Cancel") { dismiss() })
        }
    }
}

#Preview {
    HomeView()
}


