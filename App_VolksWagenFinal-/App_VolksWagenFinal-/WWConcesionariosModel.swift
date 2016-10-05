//
//  WWConcesionariosModel.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWConcesionariosModel: NSObject {
    
    var Contacto : String?
    var CoreoContacto : String?
    var Horario : String?
    var Nombre : String?
    var Provincia_Nombre : String?
    var Responsable : String?
    var telefono : Int?
    var Ubicacion : String?
    var Imagen : String?
    var Longitud : Double?
    var Latitud : Double?
    
    init(pContacto : String, pCoreoContacto : String, pHorario : String, pNombre : String, pProvincia_Nombre : String, pResponsable : String, ptelefono : Int, pUbicacion : String,
         pImagen : String, pLongitud : Double, pLatitud : Double) {
        
        self.Contacto = pContacto
        self.CoreoContacto = pCoreoContacto
        self.Horario = pHorario
        self.Nombre = pNombre
        self.Provincia_Nombre = pProvincia_Nombre
        self.Responsable = pResponsable
        self.telefono = ptelefono
        self.Ubicacion = pUbicacion
        self.Imagen = pImagen
        self.Longitud = pLongitud
        self.Latitud = pLatitud
    }
}
