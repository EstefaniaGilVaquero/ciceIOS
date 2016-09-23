//
//  APISingleton.swift
//  App_MVC_INTRO_WEB_SERVICE
//
//  Created by cice on 20/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class APISingleton: NSObject {
    
    let tenis = APITenisParser()
    let CONSTANTES = Constantes()
    
    class var sharedInstance : APISingleton{
        struct Singleton {
            static let instance = APISingleton()
        }
        return Singleton.instance
    }
    
    func getTenisDataApi() -> [ICOModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayTenisModel = tenis.getTenisData(jsonData!)
        return arrayTenisModel
    }

}
