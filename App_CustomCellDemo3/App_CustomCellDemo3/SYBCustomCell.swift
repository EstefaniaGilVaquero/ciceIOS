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
    
    @IBOutlet weak var myImageProfile: UIImageView!
    @IBOutlet weak var myTwitterLBL: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myFechaLBL: UILabel!
    
    
    
    
override func awakeFromNib() {
        super.awakeFromNib()
    
    myImageProfile.layer.cornerRadius = myImageProfile.frame.width / 2
    myImageProfile.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
