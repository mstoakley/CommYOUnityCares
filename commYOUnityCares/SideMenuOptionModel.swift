//
//  SideMenuOptionModel.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import Foundation
enum SideMenuOptionModel: Int, CaseIterable{
    
    case profile
    case studenthub
    case help
    case settings
    
    
    
    var title: String{
        switch self{
       
        case .profile:
            return "Profile"
        case .studenthub:
            return "Student Hub"
        case .settings:
            return "Settings"
        case .help:
            return "Help"
        }
    }
    
    var systemImageName: String{
        switch self{
        case .profile:
            return "person"
        case .studenthub:
            return "pencil"
        case .settings:
            return "gear"
        case .help:
            return "hand.raised"
        }
    }
}
extension SideMenuOptionModel: Identifiable{
    var id: Int {
        return self.rawValue
    }
}
