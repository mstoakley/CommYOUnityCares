//
//  SideMenuRowView.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct SideMenuRowView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    let option: SideMenuOptionModel
    @Binding var selectedOption:SideMenuOptionModel?
    private var isSelected: Bool{
        return selectedOption == option
    }
    var body: some View {
        HStack{
            Image(systemName: option.systemImageName)
                .imageScale(.medium)
            
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue: .primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .blue.opacity(0.15): .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
    }
    
}
   

#Preview {
    SideMenuRowView(option: .home,selectedOption: .constant(.home))
}
