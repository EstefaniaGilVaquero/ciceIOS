//
//  VWOfertasParser.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 10/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class VWOfertasParser: NSObject {
    func getOfertasModel(dataFromNetwork : NSData) -> [VWOfertasModel]{
        //1. creamos el array contenedor de datos
        var arrayOfertasModel = [VWOfertasModel]()
        //2. lectura del JSON
        let readableJSON = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        for index in 0...readableJSON.count - 1{
            let ofertasModel = VWOfertasModel(pId: dimeInt(readableJSON[index], nombre: "id"),
                                              pFechaInicio: dimeString(readableJSON[index],nombre: "fechaInicio"),
                                              pFechaFin: dimeString(readableJSON[index],nombre: "fechafin"),
                                              pNombre: dimeString(readableJSON[index],nombre: "nombre"),
                                              pImagen: dimeString(readableJSON[index],nombre: "imagen"),
                                              pDescripcion: dimeString(readableJSON[index],nombre: "descripcion"),
                                              pIdConcesionario: dimeString(readableJSON[index],nombre: "idConcesionario"),
                                              pPrecio: dimeString(readableJSON[index],nombre: "precio"))
            arrayOfertasModel.append(ofertasModel)
        }
        return arrayOfertasModel
    }
}

