//
//  SplitPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//

import SwiftUI

struct SplitPgView: View {
    var body: some View {
            VStack{
                Label("Do you need help?", systemImage: "1.circle")
                NavigationLink("Yes", destination: HelpPgView())
                Label("Do you want to help?", systemImage: "2.circle")
                NavigationLink("Yes", destination: VolPgView())
                
            }
            
    }
}

#Preview {
    SplitPgView()
}
