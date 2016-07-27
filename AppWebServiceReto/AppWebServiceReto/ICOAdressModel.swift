//
//  ICOAdressModel.swift
//  App_MVC_INTRO_WEB_SERVICE
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOAdressModel: NSObject {
    
    var street : String?
    var suit : String?
    var city : String?
    var zipcode : String?
    var geo : String?
    
    
    init(pStreet : String, pSuit: String, pCity : String, pZipcode : String, pGeo : String) {
        self.street = pStreet
        self.suit = pJugador1
        self.city = pJugador2
        self.zipcode = pResultados
        self.geo = pResultados2
        super.init()
    }
    
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
    "lat": "-37.3159",
    "lng": "81.1496"
    }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
    }

}
