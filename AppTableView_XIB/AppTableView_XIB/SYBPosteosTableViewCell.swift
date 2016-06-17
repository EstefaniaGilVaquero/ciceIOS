//
//  SYBPosteosTableViewCell.swift
//  AppTableView_XIB
//
//  Created by cice on 17/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBPosteosTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImageFriend: UIImageView!
    @IBOutlet weak var myNameFriend: UILabel!
    @IBOutlet weak var myJobLBL: UILabel!
    @IBOutlet weak var myLastPostLBL: UILabel!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var myImagePost: UIImageView!
    @IBOutlet weak var myTitleLBL: UILabel!
    @IBOutlet weak var myFontPost: UILabel!
    @IBOutlet weak var myLikesNumber: UILabel!
    @IBOutlet weak var myPostNumber: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageFriend.layer.cornerRadius = myImageFriend.frame.width / 6
        myImageFriend.layer.borderColor = UIColor(red: 0.98, green: 0.64, blue: 0.21, alpha: 1.0).CGColor
        myImageFriend.layer.borderWidth = 1.5
        myImageFriend.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
