//
//  ICOTableViewCell.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOTableViewCell: UITableViewCell {

    @IBOutlet weak var myIdentificadorLbl: UILabel!
    @IBOutlet weak var myNameLbl: UILabel!
    @IBOutlet weak var myUsernameLbl: UILabel!
    @IBOutlet weak var myEmailLbl: UILabel!
    @IBOutlet weak var myStreetLbl: UILabel!
    @IBOutlet weak var mySuiteLbl: UILabel!
    @IBOutlet weak var myCityLbl: UILabel!
    @IBOutlet weak var myZipcodeLbl: UILabel!
    @IBOutlet weak var myLatLbl: UILabel!
    @IBOutlet weak var myLngLbl: UILabel!
    @IBOutlet weak var myWebsiteLbl: UILabel!
    @IBOutlet weak var myCompanyNameLbl: UILabel!
    @IBOutlet weak var myCatchPhraseLbl: UILabel!
    @IBOutlet weak var myBsLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
