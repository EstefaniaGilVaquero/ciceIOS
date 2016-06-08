//
//  SYBCochesModel.swift
//  AppTableViewDemo2
//
//  Created by cice on 8/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBCochesModel: NSObject {
    
    
    
    
    //Declaramos nuestras variables del modelo
    
    var name : String?
    var color : String?
    var foto : UIImage?
    
    //Inicilizador designado / Constructor designado
    
    init(aName : String, aColor : String, aFoto : UIImage) {
        self.name = aName
        self.color = aColor
        self.foto = aFoto
        super.init()
    }
    
    
    
    
    

}
