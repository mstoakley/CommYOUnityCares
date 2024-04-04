//
//  PostView.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 3/22/24.
//

import Foundation
import UIKit

class PostView: UIView {
    
    public var Title = "Title"
    public var Body = "Body"
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
   
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_: CGRect){
        let path = UIBezierPath()
        path.move(to: CGPoint(x:0,y:95))
        path.addLine(to: CGPoint(x:400,y:95))
        path.lineWidth = 2.0
        UIColor.lightGray.setStroke()
        path.close()
        path.stroke()
        
    }
    
    private func setup(){
        self.backgroundColor = UIColor.white
        //Profile Picture
        let ProPic = UIImageView(frame: CGRect(x:0,y:0, width: 50, height: 50))
        ProPic.image = UIImage(systemName: "person")
        self.addSubview(ProPic)
        
        
        //Title
        let PostTitle = UILabel(frame: CGRect(x:0, y:60,width:150,height:20))
        PostTitle.adjustsFontSizeToFitWidth = false
        PostTitle.font = UIFont(name: "SF Pro", size: 35)
        PostTitle.textColor = UIColor.black
        PostTitle.text = Title
        self.addSubview(PostTitle)
        
        
        //Post Divider
        draw(self.frame)
        
        
        //Body
        let PostBody = UILabel(frame: CGRect(x:0, y:105,width:100,height:20))
        PostBody.textColor = UIColor.lightGray
        PostBody.text = Body
        self.addSubview(PostBody)
        
        
    }
}


