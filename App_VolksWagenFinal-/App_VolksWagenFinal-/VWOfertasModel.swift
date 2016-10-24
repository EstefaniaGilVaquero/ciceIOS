//
//  VWOfertasModel.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 10/10/16.
//  Copyright © 2016 icologic. All rights reserved.
// info@icologic.co

import UIKit

class VWOfertasModel: NSObject {
    
    var id :Int?
    var fechaInicio : String?
    var fechaFin : String?
    var nombre : String?
    var imagen : String?
    var descripcion : String
    var idConcesionario : String?
    var precio :String?
    
    init(pId : Int, pFechaInicio : String, pFechaFin : String, pNombre : String, pImagen : String, pDescripcion : String, pIdConcesionario : String, pPrecio : String) {
        
        self.id = pId
        self.fechaInicio = pFechaInicio
        self.fechaFin = pFechaFin
        self.nombre = pNombre
        self.imagen = pImagen
        self.descripcion = pDescripcion
        self.idConcesionario = pIdConcesionario
        self.precio = pPrecio
        super.init()
    }
    

}
