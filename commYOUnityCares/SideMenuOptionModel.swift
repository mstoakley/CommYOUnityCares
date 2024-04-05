//
//  SideMenuOptionModel.swift
//  commYOUnityCares
//
//  Created by Mariah J Stoakley on 3/28/24.
//

import Foundation
enum SideMenuOptionModel: Int, CaseIterable{
 
    case settings
    case profile
    case studenthub
    
    
    var title: String{
        switch self{
       
        case .profile:
            return "Profile"
        case .studenthub:
            return "Student Hub"
        case .settings:
            return "Settings"
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
        }
    }
}
extension SideMenuOptionModel: Identifiable{
    var id: Int {
        return self.rawValue
    }
}
