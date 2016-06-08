//
//  SYBModeloCoches.swift
//  AppTableViewDemo2Ejercicio
//
//  Created by cice on 8/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBModeloCoches: NSObject {
    
    var nombre : String?
    var color : String?
    var foto : UIImage
    
    init(aNombre : String, aColor : String, aFoto : UIImage) {
        self.nombre = aNombre
        self.color = aColor
        self.foto = aFoto
        super.init()
    }

}
