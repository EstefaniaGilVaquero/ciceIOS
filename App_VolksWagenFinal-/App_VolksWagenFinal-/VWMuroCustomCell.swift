//
//  VWMuroCustomCell.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 24/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWMuroCustomCell: UITableViewCell {
    @IBOutlet weak var myDescripcionFoto: UILabel!
    @IBOutlet weak var myNombreUsuario: UILabel!
    @IBOutlet weak var myImagen: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
