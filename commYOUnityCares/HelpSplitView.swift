//
//  SplitPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//
import SwiftUI
struct HelpSplitView: View {
    var body: some View {
        VStack{
            Label("Do you need help?", systemImage: "1.circle")
            NavigationLink("Yes", destination: HelpNeedForm())
            Label("Do you want to help?", systemImage: "2.circle")
            NavigationLink("Yes", destination: VolFormView())
        }
    }
}
#Preview {
    HelpSplitView()
}
