//
//  VWOfertasCustomCell.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWOfertasCustomCell: UITableViewCell {
    
    @IBOutlet weak var myImagenOferta: UIImageView!
    @IBOutlet weak var myFechaFin: UILabel!
    @IBOutlet weak var myMasInformacionLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
