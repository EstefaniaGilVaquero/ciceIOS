//
//  APIManagerFinal.swift
//  AppWebServiceReto
//
//  Created by cice on 27/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class APIManagerFinal: NSObject {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    let users = ICOUsersParser()
    let CONSTANTES = APIConstantes()
    
    //MARK: - SINGLETON
    
    class var sharedInstance : APIManager{
        struct SingletonAPP {
            static let instancia = APIManager()
        }
        return SingletonAPP.instancia
    }
    
    
    //MARK: - GET USERS
    func getUsersAPI() -> [ICOModel] {
        let url = NSURL(string : CONSTANTES.BASE_URL)
    }

}
