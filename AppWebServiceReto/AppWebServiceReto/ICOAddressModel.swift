//
//  ICOAddressModel.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOAdressModel: NSObject {
    
    var street : String?
    var suit : String?
    var city : String?
    var zipcode : String?
    var geo : ICOGeoModel?
    
    
    init(pStreet : String, pSuit: String, pCity : String, pZipcode : String, pGeo : ICOGeoModel) {
        self.street = pStreet
        self.suit = pSuit
        self.city = pCity
        self.zipcode = pZipcode
        self.geo = pGeo
        super.init()
    }
    
}
