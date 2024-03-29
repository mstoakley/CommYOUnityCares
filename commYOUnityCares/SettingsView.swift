//
//  SettingsView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    @AppStorage("selectedLanguage") private var selectedLanguage = "English"
    let languages = ["English", "Spanish", "French","Mandrin"] // Add more languages as needed
    
    var body: some View {
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
                
                Section(header: Text("Accessibility")) {
                    // Placeholder for accessibility features
                    Text("Accessibility features here")
                    // Implement actual features based on your requirements
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}


#Preview {
    SettingsView()
}
