//
//  WWConcesoniarioCustomCell.swift
//  
//
//  Created by CICE on 3/10/16.
//
//

import UIKit

class WWConcesoniarioCustomCell: UITableViewCell {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImagenConcesionario: UIImageView!
    @IBOutlet weak var myNombreConcesionario: UILabel!
    @IBOutlet weak var myDireccionConcesionario: UILabel!
    @IBOutlet weak var myWebConcesionario: UILabel!
    @IBOutlet weak var myTelefonoConcesionario: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
