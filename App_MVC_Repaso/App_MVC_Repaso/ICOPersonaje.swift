//
//  ICOPersonaje.swift
//  App_MVC_Repaso
//
//  Created by cice on 6/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOPersonaje: NSObject {
    
    var firstName :String?
    var lastName : String?
    var alias : String?
    var telefono : String?
    var direccion : String?
    var cumpleanos : String?
    var email : String?
    var cv : String?
    var biografia : String?
    var imagen : UIImage?
    
    
    init(aFirstName : String, aLastName : String, aAlias : String, aTelefono : String, aDireccion : String, aCumpleanos : String, aEmail : String, aCv : String, aBiografia : String, aImagen : UIImage) {
        firstName = aFirstName
        lastName = aLastName
        alias = aAlias
        telefono = aTelefono
        direccion = aDireccion
        cumpleanos = aCumpleanos
        email = aEmail
        cv = aCv
        biografia = aBiografia
        imagen = aImagen
        
        super.init()
    }

}
