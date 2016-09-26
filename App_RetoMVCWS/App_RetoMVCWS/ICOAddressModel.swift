//
//  ICOAddressModel.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOAddressModel: NSObject {
    
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : ICOGeoModel?
    
    init(pStreet : String, pSuite : String, pCity : String, pZipcode : String, pGeo : ICOGeoModel) {
        self.street = pStreet
        self.suite = pSuite
        self.city = pCity
        self.zipcode = pZipcode
        self.geo = pGeo
        super.init()
    }
    

}
