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
    
    var tabName: String {
            switch selectedTab {
                case 0: return "Profile"
                case 1: return "Student Hub"
                case 2: return "Help"
                default: return "Settings"
            }
        }
    
    var body: some View {
        TabView {
            VStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            VStack {
                CommunityMapView()
            }
            .tabItem {
                Image(systemName: "map")
                Text("Finder")
            }
            NavigationStack {
                ZStack {
                    TabView(selection: $selectedTab) {
                        ProfileView()
                            .tag(0)
                        StudentFormView()
                            .tag(1)
                        SplitPgView()
                            .tag(2)
                        SettingsView()
                            .tag(3)
                    }
                    SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                        .padding()
                }
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .navigationTitle(tabName)
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
