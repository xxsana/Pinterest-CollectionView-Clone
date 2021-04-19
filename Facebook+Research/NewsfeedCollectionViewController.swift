//
//  NewsfeedCollectionViewController.swift
//  Facebook+Research
//
//  Created by Duc Tran on 3/20/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class NewsfeedCollectionViewController : UICollectionViewController
{
    var searchController: UISearchController!
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchPosts()
        collectionView?.contentInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 200, height: 300)
        }
    }
    
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        self.collectionView?.reloadData()
    }
}

extension NewsfeedCollectionViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCollectionViewCell
        cell.post = self.posts?[indexPath.item]
        return cell
    }
}

















