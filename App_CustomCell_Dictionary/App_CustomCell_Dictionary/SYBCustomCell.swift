//
//  SYBCustomCell.swift
//  App_CustomCell_Dictionary
//
//  Created by cice on 13/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBCustomCell: UITableViewCell {

    @IBOutlet weak var myNombreL: UILabel!
    
    @IBOutlet weak var myApellidoLBL: UILabel!
    
    @IBOutlet weak var myDescripcionLBL: UILabel!
    
    @IBOutlet weak var myImageIV: UIImageView!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
