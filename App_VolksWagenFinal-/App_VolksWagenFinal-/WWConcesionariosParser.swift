//
//  WWConcesionariosParser.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON

class WWConcesionariosParser: NSObject {
    
    func getConcesionariosModel(dataFromNetwork : NSData) -> [WWConcesionariosModel]{
        //1. Creamos el array contenedor de datos
        var arrayConcesionariosModel = [WWConcesionariosModel]()
        //2. Lectura del JSON
        let readableJson = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        //3. 
        for index in 0...readableJson.count - 1{
            let concesionarioModel = WWConcesionariosModel(pContacto: dimeString(readableJson[index], nombre: "Contacto"),
                                                           pCoreoContacto: dimeString(readableJson[index], nombre: "CoreoContacto"),
                                                           pHorario: dimeString(readableJson[index], nombre: "Horario"),
                                                           pNombre: dimeString(readableJson[index], nombre: "Nombre"),
                                                           pProvincia_Nombre: dimeString(readableJson[index], nombre: "Provincia_Nombre"),
                                                           pResponsable: dimeString(readableJson[index], nombre: "Responsable"),
                                                           ptelefono: dimeInt(readableJson[index], nombre: "telefono"),
                                                           pUbicacion: dimeString(readableJson[index], nombre: "Ubicacion"),
                                                           pImagen: dimeString(readableJson[index], nombre: "Imagen"),
                                                           pLongitud: dimeDouble(readableJson[index], nombre: "Longitud"),
                                                           pLatitud: dimeDouble(readableJson[index], nombre: "Latitud"))
        
            arrayConcesionariosModel.append(concesionarioModel)
        
        }
        
        return arrayConcesionariosModel
        
    }
    
    

}
