//
//  ICOUsersCustomCell.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOUsersCustomCell: UITableViewCell {
    
    
    @IBOutlet weak var myIdLBL: UILabel!
    @IBOutlet weak var myNameLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myUsernameLBL: UILabel!
    @IBOutlet weak var myStreetLBL: UILabel!
    @IBOutlet weak var mySuiteLBL: UILabel!
    @IBOutlet weak var myCityLBL: UILabel!
    @IBOutlet weak var myZipcodeLBL: UILabel!
    @IBOutlet weak var myLatitudLBL: UILabel!
    @IBOutlet weak var myLongitudLBL: UILabel!
    @IBOutlet weak var myPhoneLBL: UILabel!
    @IBOutlet weak var myWebsiteLBL: UILabel!
    @IBOutlet weak var myComapanyNameLBL: UILabel!
    @IBOutlet weak var myCatchPhraseLBL: UILabel!
    @IBOutlet weak var myBsLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
