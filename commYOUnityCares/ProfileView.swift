//
//  ProfileView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 4/5/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileImageView()
                .padding(.top, 50)
            
            Text("Finn Mertins")
                .font(.title)
                .padding(.top, 20)
            
            ProfileInfoView(label: "Email:", value: "finnmertins@email.com")
            
            ProfileInfoView(label: "Phone Number:", value: "123-456-7890")
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileImageView: View {
    var body: some View {
        Image("profile_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ProfileInfoView: View {
    var label: String
    var value: String
    
    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
            Text(value)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.top, 10)
    }
}

#Preview{
    ProfileView()
}
