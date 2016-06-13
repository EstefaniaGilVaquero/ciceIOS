//
//  SYBCustomCell.swift
//  App_CustomCell_Dictionary_Practica
//
//  Created by cice on 13/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBCustomCell: UITableViewCell {
    
    
    //MARK: - IBOUTLET
    
    
    @IBOutlet weak var myImageProfileIV: UIImageView!
    @IBOutlet weak var myUsernameTwitterLBL: UILabel!
    @IBOutlet weak var myDatePostBL: UILabel!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var myNameuserLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myImagePostIV: UIImageView!
    @IBOutlet weak var myLikeStringLBL: UILabel!
    @IBOutlet weak var myShareStringLBL: UILabel!
    @IBOutlet weak var myCommentStringLBL: UILabel!

override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageProfileIV.layer.cornerRadius = myImageProfileIV.frame.width / 2
        myImageProfileIV.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
