//
//  ICOParserUsers.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class ICOParserUsers: NSObject {
    
    
    func getUsersModel(dataFromNetworking : NSData) -> [ICOUsersModel]{
        
        var arrayUsersModel = [ICOUsersModel]()
        
        let readableJSON = JSON(data: dataFromNetworking, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        for item in 0..<readableJSON.count{
            
            let geoModel = ICOGeoModel(pLat: readableJSON[item]["address"]["geo"]["lat"].string!,
                                       pLng: readableJSON[item]["address"]["geo"]["lng"].string!)
            
            let companyModel = ICOCompanyModel(pName: readableJSON[item]["company"]["name"].string!,
                                               pCatchPhrase: readableJSON[item]["company"]["catchPhrase"].string!,
                                               pBs: readableJSON[item]["company"]["bs"].string!)
            
            let addressModel = ICOAddressModel(pStreet: readableJSON[item]["address"]["street"].string!,
                                               pSuite: readableJSON[item]["address"]["suite"].string!,
                                               pCity: readableJSON[item]["address"]["city"].string!,
                                               pZipcode: readableJSON[item]["address"]["zipcode"].string!,
                                               pGeo: geoModel)
            
            let usersModel = ICOUsersModel(pId: readableJSON[item]["id"].int!,
                                           pName: readableJSON[item]["name"].string!,
                                           pUsername: readableJSON[item]["username"].string!,
                                           pEmail: readableJSON[item]["email"].string!,
                                           pAddress: addressModel,
                                           pPhone: readableJSON[item]["phone"].string!,
                                           pWebsite: readableJSON[item]["website"].string!,
                                           pCompany: companyModel)
            
            
            
            arrayUsersModel.append(usersModel)
        }
        return arrayUsersModel
    }
    

}
