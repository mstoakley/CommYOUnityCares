//
//  SplitPgView.swift
//  volSwift
//
//  Created by Sanai Ranae Fitchett on 3/28/24.
//

import SwiftUI

struct SplitPgView: View {
    var body: some View {
        NavigationView{
            NavigationView{
                Form {
                    Section(header: Text("Need Help?")) {
                        NavigationLink("Assistance Form", destination: HelpPgView())
                    }
                    
                    Section(header: Text("Want To Help?")) {
                        NavigationLink("Volunteer Form", destination: VolPgView())
                    }
                }
                
            }
            Spacer()
        }
            
    }
}

#Preview {
    SplitPgView()
}
