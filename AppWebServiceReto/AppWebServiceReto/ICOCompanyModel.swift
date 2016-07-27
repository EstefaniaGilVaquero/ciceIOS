//
//  ICOCompanyModel.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOCompanyModel: NSObject {
    
    var name : String?
    var catchphrase : String?
    var bs : String?
    
    init(pName : String, pCatchphrase : String, pBs : String) {
        
        self.name = pName
        self.catchphrase = pCatchphrase
        self.bs = pBs
        super.init()
    }

}
