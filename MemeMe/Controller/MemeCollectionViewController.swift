//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 15/06/21.
//

import UIKit

class MemeCollectionViewController: UIViewController {
    
    @IBOutlet weak var memeCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeCollectionView.delegate = self
        memeCollectionView.dataSource = self
        
        let space:CGFloat = 5.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.estimatedItemSize = CGSize(width: dimension, height: dimension)
    }
    
}

extension MemeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = memeCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.memeImage
        return cell
    }
    
}
