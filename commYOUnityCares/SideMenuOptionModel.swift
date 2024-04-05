//
//  SideMenuOptionModel.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import Foundation
enum SideMenuOptionModel: Int, CaseIterable{
    case home
    case settings
    case profile
    case logout
    
    
    var title: String{
        switch self{
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .logout:
            return "Logout"
        case .settings:
            return "Settings"
        }
    }
    
    var systemImageName: String{
        switch self{
        case .home:
            return "house"
        case .profile:
            return "person"
        case .logout:
            return "rectangle.portrait.and.arrow.right"
        case .settings:
            return "gear"
        }
    }
}
extension SideMenuOptionModel: Identifiable{
    var id: Int {
        return self.rawValue
    }
}
