//
//  SYBTableViewCell.swift
//  APP_CompartirContacto
//
//  Created by cice on 9/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBTableViewCell: UITableViewCell {
    
    
    //parsear datos del json
    //http://91.126.140.33:5554/pagina2/home/index

    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myUsernameLBL: UILabel!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myFotoIV: UIImageView!
    @IBOutlet weak var mySharedButton: UIButton!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
