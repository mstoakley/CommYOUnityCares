//  HelpPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//

import SwiftUI

struct HelpNeedForm: View {
    var body: some View {
        @State var needHelp = false
        @State var needClothing = false
        @State var needMoney = false
        @State var needFood = false
        Text("How would you like the community to help you?")
        Form{
            Section(header: Text("Donations")){
                Toggle("Food Assitance",isOn: $needFood)
                Toggle("Clothing Assistance",isOn: $needClothing)
                Toggle("Money Assistance", isOn: $needMoney)
            }
        }
    }
}

#Preview {
    HelpNeedForm()
}
