//
//  PostCollectionView.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 4/2/24.
//

import Foundation
import UIKit



class PostViewController: UIViewController

{
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension PostViewController: UICollectionViewDelegate 
{
    
}
extension PostViewController: UICollectionViewDataSource {}
extension PostViewController: UICollectionViewDelegateFlowLayout {}
