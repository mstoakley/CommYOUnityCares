//
//  commYOUnityCaresApp.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

@main
struct commYOUnityCaresApp: App {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
            }
        }
}
