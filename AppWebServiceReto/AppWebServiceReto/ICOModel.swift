//
//  ICOModel.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICOModel: NSObject {
    
    
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address : ICOAdressModel?
    var phone : String?
    var website : String?
    var company : ICOCompanyModel
    
    init(pId : Int, pName : String, pUsername : String, pEmail : String, pAdress : ICOAdressModel, pPhone : String, pWebsite : String, pCompany : ICOCompanyModel) {
        self.name = pName
        self.username = pUsername
        self.email = pEmail
        self.phone = pPhone
        self.website = pWebsite
        self.company = pCompany
        super.init()
    }
    
}
