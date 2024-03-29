//
//  VolPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//
import SwiftUI
struct VolFormView: View {
    var body: some View {
        @State var donateFood = false
        @State var donateClothing = false
        @State var donateMoney = false
        @State var helpFood = false
        @State var helpOutreach = false
        Text("How would you like to help the community?")
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
    }
}

#Preview {
    VolFormView()
}
