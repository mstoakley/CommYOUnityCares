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
    var body: some View {
        NavigationStack{
            ZStack{
                TabView(selection:$selectedTab){
                    
                    Text("Home")
                        .tag(3)
                    SettingsView()
                        .tag(0)
                    Text("Profile")// include profile page
                        .tag(1)
                    Text("Logout")//some sort of function so you logout and are brought to login page
                        .tag(2)
                    
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
            }
        }
    }
}
#Preview {
    ContentView()
}
