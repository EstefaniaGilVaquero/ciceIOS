//
//  APIManager.swift
//  App_RetoMVCWS
//
//  Created by User on 27/7/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    //MARK: - Variables locales
    let users = ICOParserUsers()
    let CONSTANTES = APIConstantes()
    
    
    //MARK: - SINGLETON
    class var sharedInstance : APIManager {
        struct SingletonAPP {
            static let instancia = APIManager()
        }
        return SingletonAPP.instancia
    }
    
    
    //MARK: - GET USERS
    func getUsersApi() -> [ICOUsersModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayUsersModel = users.getUsersModel(jsonData!)
        return arrayUsersModel
    }

}
