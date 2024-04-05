//
//  HelpPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//

import SwiftUI

struct HelpPgView: View {
    @State var needHelp = false
    @State var needClothing = false
    @State var needMoney = false
    @State var needFood = false
    @State var HelpFormSaved = false
    @State var showAlert = false
    var body: some View {
        NavigationView{
            VStack{
                Text("How would you like the community to help you?").font(.headline)
                Form{
                    Section(header: Text("Donations")){
                        Toggle("Food Assitance",isOn: $needFood)
                        Toggle("Clothing Assistance",isOn: $needClothing)
                        Toggle("Money Assistance", isOn: $needMoney)
                    }
                }
                Button(action: { save()
                    if showAlert{
                        HelpFormSaved = true
                    }
                }){
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .background(HelpFormSaved ? Color.gray : Color.blue)
                        .cornerRadius(10)
                        .disabled(HelpFormSaved)
                }
                .padding()
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Success!"), message: Text("Your form has been saved."))
                }
                .navigationBarTitle("Assistance Form")
            }
        }
        
    }
    private func save(){
        showAlert = true
        HelpFormSaved = true
    }
}

#Preview {
    HelpPgView()
}
