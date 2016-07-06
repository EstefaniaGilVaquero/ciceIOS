//
//  ICOCustomCell.swift
//  App_TaskVersion2.0
//
//  Created by formador on 4/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOCustomCell: UITableViewCell {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myTareaLBL: UILabel!
    @IBOutlet weak var myPrioridadTarea: UILabel!
    @IBOutlet weak var myDescripcionTareaLBL: UILabel!
    @IBOutlet weak var myFechaTareaLBL: UILabel!
    @IBOutlet weak var myCategoriaLBL: UILabel!
    @IBOutlet weak var myImageIV: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageIV.layer.cornerRadius = myImageIV.frame.width / 2
        myImageIV.layer.borderColor = UIColor.blackColor().CGColor
        myImageIV.layer.borderWidth = 1.3
        myImageIV.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
