//
//  ICOGeoModel.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOGeoModel: NSObject {
    
    
    var lat : String?
    var lng : String?
    
    init(pLat : String, pLng : String) {
        self.lat = pLat
        self.lng = pLng
        super.init()
    }

}
