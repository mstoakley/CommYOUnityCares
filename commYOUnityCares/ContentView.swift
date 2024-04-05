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
        if isLoggedIn {
                 loggedInContent()
             } else {
                 LogInView()
             }
         }
         
    func loggedInContent() -> some View{
    TabView{
            NavigationStack{
                ZStack{
                    TabView(selection:$selectedTab){
                        
                        Text("Student Hub")//whoops
                            .tag(3)
                        SettingsView()
                            .tag(0)
                        Text("Profile")// include profile page
                            .tag(1)
                       
                        
                    }
                    SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                        .padding()
                }
                .toolbar(showMenu ? .hidden: .visible ,for:.navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action:{
                            showMenu.toggle()
                        }, label:{
                            Image(systemName: "line.3.horizontal")
                        })
                    }
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            VStack{
                CommunityMapView()
            }.tabItem {
                Image(systemName: "map")
                Text("Finder")
            }
            VStack{
                SplitPgView()
            }.tabItem {
                Image(systemName: "person.3")
                Text("Help")
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
