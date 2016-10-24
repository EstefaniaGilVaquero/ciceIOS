//
//  VWConcesionarioCustomCell.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 3/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWConcesionarioCustomCell: UITableViewCell {
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myImagenConcesionario: UIImageView!
    @IBOutlet weak var myNombreConcesionario: UILabel!
    @IBOutlet weak var myDireccionConcesionario: UILabel!
    @IBOutlet weak var myWebConcesionario: UILabel!
    @IBOutlet weak var hacerLlamada: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
