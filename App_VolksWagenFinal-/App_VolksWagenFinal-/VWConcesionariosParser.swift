//
//  VWConcesionariosParser.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class VWConcesionariosParser: NSObject {
    func getConcesionariosModel(dataFromNetwork : NSData) -> [VWConcesionariosModel]{
        //1. creamos el array contenedor de datos
        var arrayConcesionariosModel = [VWConcesionariosModel]()
        //2. lectura del JSON
        let readableJSON = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        for index in 0...readableJSON.count - 1{
            let concesionarioModel = VWConcesionariosModel(pContacto: dimeString(readableJSON[index], nombre: "Contacto"),
                                                           pCoreoContacto: dimeString(readableJSON[index], nombre: "CoreoContacto"),
                                                           pHorario: dimeString(readableJSON[index], nombre: "Horario"),
                                                           pNombre: dimeString(readableJSON[index], nombre: "Nombre"),
                                                           pProvincia_Nombre: dimeString(readableJSON[index], nombre: "Provincia_Nombre"),
                                                           pResponsable: dimeString(readableJSON[index], nombre: "Responsable"),
                                                           pTelefono: dimeInt(readableJSON[index], nombre: "telefono"),
                                                           pUbicacion: dimeString(readableJSON[index], nombre: "Ubicacion"),
                                                           pImagen: dimeString(readableJSON[index], nombre: "Imagen"),
                                                           pLongitud: dimeDouble(readableJSON[index], nombre: "Longitud"),
                                                           pLatitud: dimeDouble(readableJSON[index], nombre: "Latitud"))
            arrayConcesionariosModel.append(concesionarioModel)
        }
        return arrayConcesionariosModel
    }
}
