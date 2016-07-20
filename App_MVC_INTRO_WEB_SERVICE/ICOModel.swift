//
//  ICOModel.swift
//  App_MVC_INTRO_WEB_SERVICE
//
//  Created by cice on 20/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOModel: NSObject {
    
    
    var estado : String?
    var jugador1 : String?
    var jugador2 : String?
    var resultados : String?
    var resultados2 : String?
    
    init(pEstado : String, pJugador1 : String, pJugador2 : String, pResultados : String, pResultados2 : String) {
        self.estado = pEstado
        self.jugador1 = pJugador1
        self.jugador2 = pJugador2
        self.resultados = pResultados
        self.resultados2 = pResultados2
        super.init()
    }

}
