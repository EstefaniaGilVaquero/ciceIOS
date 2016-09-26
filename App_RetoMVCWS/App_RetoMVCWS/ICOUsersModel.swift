//
//  ICOUsersModel.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class ICOUsersModel: NSObject {
    
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address : ICOAddressModel?
    var phone : String?
    var website : String?
    var company : ICOCompanyModel?
    
    init(pId : Int, pName : String, pUsername : String, pEmail : String, pAddress : ICOAddressModel, pPhone : String, pWebsite : String, pCompany : ICOCompanyModel) {
        
        self.id = pId
        self.name = pName
        self.username = pUsername
        self.email = pEmail
        self.address = pAddress
        self.phone = pPhone
        self.website = pWebsite
        self.company = pCompany
        super.init()
        
    }

}
