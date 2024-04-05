//
//  PostCell.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/4/24.
//

import Foundation
import UIKit

class PostCell: UICollectionViewCell
{
    let postObject = PostView(frame: CGRect(x:0,y:0,width:600,height:400))
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        addSubview(postObject)
        
        postObject.translatesAutoresizingMaskIntoConstraints = false
        postObject.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postObject.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postObject.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder:NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
