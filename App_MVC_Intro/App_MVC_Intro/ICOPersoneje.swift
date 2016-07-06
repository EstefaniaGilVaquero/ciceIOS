//
//  ICOPersoneje.swift
//  App_MVC_Intro
//
//  Created by cice on 6/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOPersoneje: NSObject {
    
    var firstName : String?
    var lastName : String?
    var alias : String?
    
    
    //Este es el inicializador designado || Constructor designado
    init(aFirstName : String, aLastName : String, aAlias : String) {
        firstName = aFirstName
        lastName = aLastName
        alias = aAlias
        super.init()
    }
    
    override var description: String{
        return "Hola mi nombre es\(firstName!) y mi apellido es \(lastName!) y soy mas conocido como \(alias!)"
    }
    
}
