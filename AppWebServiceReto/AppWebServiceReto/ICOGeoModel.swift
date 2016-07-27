//
//  ICOGeoModel.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
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
