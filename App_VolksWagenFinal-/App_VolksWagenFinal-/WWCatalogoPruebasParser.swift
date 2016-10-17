//
//  WWCatalogoPruebasParser.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class WWCatalogoPruebasParser: NSObject {
    


    
    func getCatalogoPruebasModel(dataFromNetwork : NSData) -> [WWCatalogoPruebas]{
        //1. Creamos el array contenedor de datos
        var arrayCatalogoModel = [WWCatalogoPruebas]()
        //2. Lectura del JSON
        let readableJson = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        //3.
        for index in 0...readableJson.count - 1{
            let catalogoModel = WWCatalogoPruebas(pIdCatalogo: dimeInt(readableJson[index], nombre: "idCatalogo"),
                                                  pNombreModelo: dimeString(readableJson[index], nombre: "idCatalogo"),
                                                  pCilindrada: dimeFloat(readableJson[index], nombre: "Cilindrada"),
                                                  pKW: dimeFloat(readableJson[index], nombre: "KW"),
                                                  pHP: dimeFloat(readableJson[index], nombre: "HP"),
                                                  pCombustible: dimeString(readableJson[index], nombre: "Combustible"),
                                                  pImagen: dimeString(readableJson[index], nombre: "Imagen"))
            
            arrayCatalogoModel.append(catalogoModel)
            
        }
        
        return arrayCatalogoModel
        
    }

}
