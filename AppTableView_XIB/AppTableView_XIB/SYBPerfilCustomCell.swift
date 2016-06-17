//
//  SYBPerfilCustomCell.swift
//  AppTableView_XIB
//
//  Created by cice on 17/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBPerfilCustomCell: UITableViewCell {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var myImageProfile: UIImageView!
    @IBOutlet weak var myNumberCount: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myPuestoLBL: UILabel!
    @IBOutlet weak var myLugarLBL: UILabel!
    @IBOutlet weak var mySeguidoresLBL: UILabel!
    
    
    //MARK: - IBACTION
    
    @IBAction func sendMail(sender: AnyObject) {
    
    }
    
    @IBAction func showAlertVC(sender: AnyObject) {
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
}
