//
//  PostCollectionCellCollectionViewCell.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/2/24.
//

import UIKit

class PostCollectionCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var postView_cell: PostView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(title: String, body: String)
    {
        postView_cell = PostView(frame: CGRect(x:0,y:0,width:600,height:400))
        postView_cell.Title = title
        postView_cell.Body = body
    }
    
    static func nib() -> UINib
    {
        
    }
}
