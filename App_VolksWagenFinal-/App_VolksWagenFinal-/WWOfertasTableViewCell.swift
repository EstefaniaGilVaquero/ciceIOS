//
//  WWOfertasTableViewCell.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWOfertasTableViewCell: UITableViewCell {
    @IBOutlet weak var myImagen: UIImageView!
    @IBOutlet weak var myfechafin: UILabel!
    @IBOutlet weak var mymasinfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
