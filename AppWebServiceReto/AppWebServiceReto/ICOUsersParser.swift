//
//  ICOUsersParser.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit
import SwiftyJSON

class ICOUsersParser: NSObject {
    
    func getUsersData(dataFromNetwork : NSData) -> [ICOModel]{
        var arrayUsersModel = [ICOModel]()
        
        let readableJSON = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        
        for item in 0...readableJSON.count - 1{
            
            let geoModel = ICOGeoModel(pLat: readableJSON[item]["address"]["geo"]["lat"].string!,
                                       pLng: readableJSON[item]["address"]["geo"]["lng"].string!)
            
            let companyModel = ICOCompanyModel(pName: readableJSON[item]["company"]["name"].string!,
                                               pCatchphrase: readableJSON[item]["company"]["catchphrase"].string!,
                                               pBs: readableJSON[item]["company"]["bs"].string!)
            
            let addressModel = ICOAdressModel(pStreet: readableJSON[item]["address"]["street"].string!,
                                              pSuit: readableJSON[item]["address"]["suit"].string!,
                                              pCity: readableJSON[item]["address"]["city"].string!,
                                              pZipcode: readableJSON[item]["address"]["zipcode"].string!,
                                              pGeo: geoModel)
            
            let userModel = ICOModel(pId: readableJSON[item]["id"].int!,
                                     pName: readableJSON[item]["name"].string!,
                                     pUsername: readableJSON[item]["username"].string!,
                                     pEmail: readableJSON[item]["email"].string!,
                                     pAdress: addressModel,
                                     pPhone: readableJSON[item]["phone"].string!,
                                     pWebsite: readableJSON[item]["website"].string!,
                                     pCompany: companyModel)
            
            arrayUsersModel.append(userModel)
            
        
            
        }
        return arrayUsersModel
        
    }


}
