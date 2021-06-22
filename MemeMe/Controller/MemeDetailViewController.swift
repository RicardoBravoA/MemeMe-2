//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 21/06/21.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImageView.image = meme.memeImage
    }
    
}
