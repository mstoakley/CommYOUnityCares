//
//  ProfileView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 4/5/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = "Finn Mertins"
    @State private var email: String = "finnmertins@email.com"
    @State private var phoneNumber: String = "123-456-7890"
    @State private var showingEditForm = false

    var body: some View {
        NavigationView{
            VStack {
                ProfileImageView()
                    .padding(.top, 50)
                
                Text(name)
                    .font(.title)
                    .padding(.top, 20)
                
                ProfileInfoView(label: "Email:", value: email)
                ProfileInfoView(label: "Phone Number:", value: phoneNumber)
                
                Button("Edit") {
                    showingEditForm = true
                }
                .padding()
                .foregroundColor(.blue)
                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $showingEditForm) {
                EditProfileView(name: $name, email: $email, phoneNumber: $phoneNumber)
            }
        }
        
    }
}

struct EditProfileView: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var phoneNumber: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            TextField("Phone Number", text: $phoneNumber)
            
            Button("Submit") {
                dismiss()
            }
            .disabled(name.isEmpty || email.isEmpty || phoneNumber.isEmpty)
        }
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
