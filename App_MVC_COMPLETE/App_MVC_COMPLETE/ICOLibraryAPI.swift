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
    //1.Creamos una variable de clase como una variable de tipo computarizada (OBJC)
    
    class var sharedInstance : ICOLibraryAPI{
        //2. Anidamos dentro de la variable una struct llamada Singleton
        //c++ y de Haskell -> Swift
        struct Singleton {
            //3. Envuelve una constante estatica, esta es la variable implicitamente perezosa, es decir,
            //se crea cuando sea absolutamente necesario, y una unica vez.
            static let instance = ICOLibraryAPI()
        }
        //4. Devuelve la propiedad de tipo computerizado
        return Singleton.instance
    }

}
