//
//  VWUserDataModel.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 19/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWUserDataModel: NSObject {
    
    var descripcionData : String?
    var userNameData : String?
    var imagePostData : PFFile?
    
    init(pdescripcionData : String, puserNameData : String, pimagePostData : PFFile) {
        self.descripcionData = pdescripcionData
        self.userNameData = puserNameData
        self.imagePostData = pimagePostData
        super.init()
    }

}
