//
//  SideMenu.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import SwiftUI

struct SideMenu<RenderView: View>: View {
    @Binding var isShowing: Bool
    var Direction: Edge
    @ViewBuilder var content: RenderView
    var body: some View {
        ZStack(alignment: .leading){
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(.move(edge: Direction))
                    .background(
                Color.white
                )
            }
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

