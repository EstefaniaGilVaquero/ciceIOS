//
//  APITenisParser.swift
//  App_MVC_INTRO_WEB_SERVICE
//
//  Created by cice on 20/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import SwiftyJSON

class APITenisParser: NSObject {
    
    func getTenisData(dataFromNetwork : NSData) -> [ICOModel]{
        var arrayTennisModel = [ICOModel]()
        
        let readableJSON = JSON(data: dataFromNetwork, options: .MutableContainers, error: nil)
        
        for item in 0...readableJSON.count - 1{
            let dataModel = ICOModel(pEstado: readableJSON[item]["Estado"].string!,
                                     pJugador1: readableJSON[item]["Jugador1"].string!,
                                     pJugador2: readableJSON[item]["Jugador2"].string!,
                                     pResultados: readableJSON[item]["Resultados"].string!,
                                     pResultados2: readableJSON[item]["Resultados2"].string!)
            
            arrayTennisModel.append(dataModel)
        }
        return arrayTennisModel
        
    }

}
