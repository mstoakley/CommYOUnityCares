//
//  LogInView.swift
//  commYOUnityCares
//
//  Created by Autumn Leigh Thomas on 3/29/24.
//

import SwiftUI

  

struct LogInView: View {
    var body: some View {
        VStack(alignment: .center) {
             
            Text("CommYOUnity Cares")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 254/255, green: 165/255, blue: 32/255))
               
        Spacer()
            Image("Now!")
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
            Button("Sign In") {
               
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                
            }

            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 242/255, green: 242/255, blue: 248/255))
            //Spacer()
        }
        .background(Color(red: 19/255, green: 137/255, blue: 205/255, opacity: 0.8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
