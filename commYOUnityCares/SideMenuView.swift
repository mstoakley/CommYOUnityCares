//
//  SideMenuView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct SideMenuView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    @Binding var isShowing: Bool
    @State private var selectedOption: SideMenuOptionModel?
    @Binding var selectedTab: Int

    var body: some View {
        ZStack{
            if isShowing{
                
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack{
                    VStack(alignment:.leading,spacing:32){
                        SideMenuHeaderView()
                        VStack{
                            ForEach(SideMenuOptionModel.allCases){option in
                                Button(action: {
                                    onOptionTapped(option)
                                },label:{
                                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }.padding()
                    .frame(width:270,alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
            
        }
        
        .animation(.easeInOut, value:isShowing)
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
    }
    private func onOptionTapped(_ option: SideMenuOptionModel){
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true),selectedTab: .constant(0))
}

