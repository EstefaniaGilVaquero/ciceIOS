//
//  SYBContactosCustomCell.swift
//  App_TaskVersion2.0
//
//  Created by cice on 27/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBContactosCustomCell: UITableViewCell {
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myImagenContactoIV: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
