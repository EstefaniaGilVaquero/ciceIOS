//
//  ICOLibraryAPI.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOLibraryAPI: NSObject {
    
    //Creamos el patron Singleton
    
    class var sharedInstance : ICOLibraryAPI{
        struct Singleton {
            static let instance = ICOLibraryAPI()
        }
        return Singleton.instance
    }

}
