//
//  ICOCustomCell.swift
//  App_MVC_INTRO_WEB_SERVICE
//
//  Created by cice on 20/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOCustomCell: UITableViewCell {

    @IBOutlet weak var myJugador1LBL: UILabel!
    @IBOutlet weak var myJugadorLBL: UILabel!
    @IBOutlet weak var myLocationLBL: UILabel!
    @IBOutlet weak var myFechaEventoLBL: UILabel!
    @IBOutlet weak var myEstadoEnfrentamientoLBL: UILabel!
    @IBOutlet weak var myResultado1LBL: UILabel!
    @IBOutlet weak var myResultado2LBL: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
