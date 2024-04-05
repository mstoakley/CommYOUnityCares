//
//  ViewController.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 3/3/24.
//

import UIKit
import SwiftUI


import Foundation
import UIKit



class PostViewController: UIViewController

{
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


extension PostViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Press Registered")
    }
}

extension PostViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
}
/*
extension PostViewController: UICollectionViewDelegateFlowLayout
{
    
}
*/
