//
//  ICOCompanyModel.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOCompanyModel: NSObject {
    
    var name : String?
    var catchPhrase : String?
    var bs : String?
    
    init(pName : String, pCatchPhrase : String, pBs : String) {
        
        self.name = pName
        self.catchPhrase = pCatchPhrase
        self.bs = pBs
        super.init()
    }

}
