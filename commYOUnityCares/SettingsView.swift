//
//  SettingsView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    @State private var isLoggedIn = true
    @AppStorage("selectedLanguage") private var selectedLanguage = "English"
    let languages = ["English", "Spanish", "French","Mandrin"] // Add more languages as needed
    
    var body: some View {
        if isLoggedIn {
            loggedInContent()
        } else {
            LogInView()
        }
    }
    func loggedInContent() -> some View{
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $isDarkModeEnabled) {
                        Text("Enable Dark Mode")
                    }
                    
                    Picker("Change Language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) { language in
                            Text(language).tag(language)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        logout()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.red) // Use a red background

                            Text("Logout")
                                .foregroundColor(.white) // White text
                                .frame(maxWidth: .infinity) // Make the button's width fill the space
                        }
                    }
                    .frame(height: 44) // Set the height of the button
                    .listRowInsets(EdgeInsets()) // Remove the default padding of the list row

                    
                }
            }
            .navigationBarTitle("Settings")
            
        }
    }
    func logout(){
        isLoggedIn = false
    }
}


#Preview {
    SettingsView()
}
