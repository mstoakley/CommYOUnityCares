//
//  LogInView.swift
//  commYOUnityCares
//
//  Created by Autumn Leigh Thomas on 3/29/24.
//

import SwiftUI



struct LogInView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        Group {
            if !isLoggedIn {
                loginForm
            } else {
                ContentView()
            }
        }
        
    }
    
    var loginForm: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("CommYOUnity Cares")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
            
            Spacer()
            Image("Now")
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 200, alignment: .topLeading)
            Spacer()
            
            Text("Username")
            
            
            
            TextField("Enter username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/ )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fontWeight(.semibold)
                .font(.title2)
                .padding()
            
            Text("Password")
            
            TextField("Enter password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fontWeight(.semibold)
                .font(.title2)
                .padding()
            Spacer()
            
            Button(action:{ isLoggedIn = true }) {
                Text("Sign In")
            }
            
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 242/255, green: 242/255, blue: 248/255))
            //Spacer()
            Spacer()
        }
        .background(Color(red: 19/255, green: 137/255, blue: 205/255, opacity: 0.8))
    }
}

#Preview{
    LogInView()
}
