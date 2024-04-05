//
//  ContentView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    @State private var isLoggedIn = true
    
    var body: some View {
        TabView {
            VStack {
                CommunityMapView()
            }
            .tabItem {
                Image(systemName: "map")
                Text("Finder")
            }
            VStack {
                Text("Home")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            NavigationStack {
                ZStack {
                    TabView(selection: $selectedTab) {
                        Text("Profile")
                            .tag(1)
                        Text("Student Hub")
                            .tag(2)
                        SettingsView()
                            .tag(0)
                        SplitPgView().tag(3)
                    }
                    SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                        .padding()
                }
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showMenu.toggle()
                        }) {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
    
    func logout() {
        // Perform logout actions
        // For example:
        isLoggedIn = false // Set isLoggedIn to false to show the LoginView
    }
}
    
   
        

#Preview {
    ContentView()
}
