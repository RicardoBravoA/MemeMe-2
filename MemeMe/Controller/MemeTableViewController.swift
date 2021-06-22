//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 15/06/21.
//

import UIKit

class MemeTableViewController: UIViewController {
    
    @IBOutlet weak var memeTableView: UITableView!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeTableView.dataSource = self
        memeTableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(notification:)), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc func reloadData(notification : NSNotification) {
        let data = notification.userInfo
        if let value = data?["data"] as? String {
            if(value == "load") {
                memeTableView.reloadData()
            }
        }
    }
    
}

extension MemeTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memeTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let meme = memes[indexPath.row]
        
        cell.memeLabel.text = "\(meme.topText)...\(meme.bottomText)"
        cell.memeImageView?.image = meme.memeImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
