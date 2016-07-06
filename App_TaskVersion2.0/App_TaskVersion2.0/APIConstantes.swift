//
//  APIConstantes.swift
//  App_TaskVersion2.0
//
//  Created by formador on 4/7/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import Foundation
import UIKit

struct Constantes {
    
    var LISTA_TAREA_KEY = "miListaTareasArray"
    var LISTA_DESCRIPCION_KEY = "miDescripcionTareaArray"
    var LISTA_PRIORIDAD_KEY = "miPrioridadTareaArray"
    var LISTA_CATEGORIA_KEY = "miCategoriTareaArray"
    var LISTA_FOTO_KEY = "miFotoTareaArray"
    var LISTA_FECHA_KEY = "miFechaTareaArray"
    
}


func showAlertVC(titleData : String, messageData : String) -> UIAlertController{
    
    let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    return alertVC
}
