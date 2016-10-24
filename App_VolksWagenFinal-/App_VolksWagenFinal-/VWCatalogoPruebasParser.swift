//
//  VWCatalogoPruebasParser.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class VWCatalogoPruebasParser: NSObject {
    func getCatalogoPruebasModel(dataFromNetwork : NSData) -> [VWCatalogoPruebasModel]{
        //1. creamos el array contenedor de datos
        var arrayCatalogoPruebasModel = [VWCatalogoPruebasModel]()
        //2. lectura del JSON
        let readableJSON = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        for index in 0...readableJSON.count - 1{
            let catalogoPruebasModel = VWCatalogoPruebasModel(pIdCatalogo: dimeInt(readableJSON[index], nombre: "idCatalogo"),
                                                              pNombreModelo: dimeString(readableJSON[index], nombre: "NombreModelo"),
                                                              pCilindrada: dimeFloat(readableJSON[index], nombre: "Cilindrada"),
                                                              pKW: dimeFloat(readableJSON[index], nombre: "KW"),
                                                              pHP: dimeFloat(readableJSON[index], nombre: "HP"),
                                                              pCombustible: dimeString(readableJSON[index], nombre: "Combustible"),
                                                              pImagen: dimeString(readableJSON[index], nombre: "Imagen"))
            arrayCatalogoPruebasModel.append(catalogoPruebasModel)
        }
        return arrayCatalogoPruebasModel
    }
}
