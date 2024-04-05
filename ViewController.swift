//
//  ViewController.swift
//  CommYOUnity Volunteering
//
//  Created by Adedeji Jare Kuforiji on 3/3/24.
//

import UIKit
import SwiftUI




class PostViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

{
    var collectionView: UICollectionView!
    var posts = [PostView]()
    
    
    override func viewDidLoad()
    {
    
        if (posts.count == 0)
        {
            view.backgroundColor = UIColor.systemGray6
            let dpn = UILabel()
            dpn.text = "No Posts Found"
            dpn.font = UIFont(name: "SF Pro",size:25)
            dpn.frame = CGRect(x:100,y:200,width:200, height: 25)
            dpn.textAlignment = NSTextAlignment.center
            view.addSubview(dpn)
    
        }
        else{
            let layout = UICollectionViewFlowLayout()
            collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.systemGray6
            view.addSubview(collectionView)
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(PostCell.self, forCellWithReuseIdentifier: "cell")
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return posts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCell
        return cell
    }
    
}
