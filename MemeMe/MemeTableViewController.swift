//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 15/06/21.
//

import UIKit

struct Country {
    var isoCode: String
    var name: String
}

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    let countries = [
        Country(isoCode: "at", name: "Austria"),
        Country(isoCode: "be", name: "Belgium"),
        Country(isoCode: "de", name: "Germany"),
        Country(isoCode: "el", name: "Greece"),
        Country(isoCode: "fr", name: "France"),
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.isoCode
        cell.imageView?.image = UIImage(named: country.isoCode)
        
        return cell
    }
    
}
