//
//  DatosModel.swift
//  App_MVC_Repaso
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class DatosModel: NSObject {
    
    var nombre : String?
    var apellido : String?
    var movil : Int?
    var direccion : String?
    var email : String?
    var loremIpsum : String?
    var fotoPerfil : UIImage?
    var urlWebSite : NSURL?
    
    init(pNombre : String, pApellido : String, pMovil : Int, pDireccion : String, pEmail : String,
        pLoremIpsum : String, pFotoPerfil : UIImage, pUrlWebSite : NSURL) {
        
        self.nombre = pNombre
        self.apellido = pApellido
        self.movil = pMovil
        self.direccion = pDireccion
        self.email = pEmail
        self.loremIpsum = pLoremIpsum
        self.fotoPerfil = pFotoPerfil
        self.urlWebSite = pUrlWebSite
    }

}
