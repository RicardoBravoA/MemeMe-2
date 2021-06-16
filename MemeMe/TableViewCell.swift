//
//  TableViewCell.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 16/06/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var memeView: UIView!
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          let bottomSpace: CGFloat = 1
          self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
     }

}
