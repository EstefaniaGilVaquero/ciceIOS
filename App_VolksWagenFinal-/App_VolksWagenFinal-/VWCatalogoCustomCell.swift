//
//  VWCatalogoCustomCell.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWCatalogoCustomCell: UITableViewCell {
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myImagenCatalogoPrueba: UIImageView!
    @IBOutlet weak var myNombreModeloCatalogoPrueba: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
