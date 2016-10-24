//
//  VWCatalogoPruebasModel.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWCatalogoPruebasModel: NSObject {
    
    
    var idCatalogo : Int?
    var NombreModelo : String?
    var Cilindrada : Float?
    var KW : Float?
    var HP : Float?
    var Combustible : String?
    var Imagen : String?
    
    init(pIdCatalogo : Int, pNombreModelo : String, pCilindrada : Float, pKW : Float, pHP : Float, pCombustible : String, pImagen : String) {
        
        self.idCatalogo = pIdCatalogo
        self.NombreModelo = pNombreModelo
        self.Cilindrada = pCilindrada
        self.KW = pKW
        self.HP = pHP
        self.Combustible = pCombustible
        self.Imagen = pImagen
        super.init()
    }
    

}
