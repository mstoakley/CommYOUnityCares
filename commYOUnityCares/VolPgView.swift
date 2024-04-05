//
//  VolPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//

import SwiftUI

struct VolPgView: View {
    @State var donateFood = false
    @State var donateClothing = false
    @State var donateMoney = false
    @State var helpFood = false
    @State var helpOutreach = false
    @State var showAlert = false
    @State var VolFormSaved = false
    var body: some View {
        NavigationView{
            VStack{
                Text("How would you like to help the community?").font(.headline)
                Form{
                    Section(header: Text("Donations")){
                        Toggle("Donate Food",isOn: $donateFood)
                        Toggle("Donate Clothes",isOn: $donateClothing)
                        Toggle("Donate Money", isOn: $donateMoney)
                    }
                    Section(header: Text("Time")){
                        Toggle("Soup Kitchen",isOn: $helpFood)
                        Toggle("Outreach Center", isOn: $helpOutreach)
                    }
                }
                
                Button(action: { save()
                    if showAlert{
                        VolFormSaved = true
                    }
                }){
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .background(VolFormSaved ? Color.gray:Color.blue)
                        .cornerRadius(10)
                        .disabled(VolFormSaved)
                }
                .padding()
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Success!"), message: Text("Your form has been saved."))
                }
                .navigationBarTitle("Volunteer Form")
            }
        }
    }
    private func save(){
        showAlert = true
        VolFormSaved = true
        
    }
}

#Preview {
    VolPgView()
}
