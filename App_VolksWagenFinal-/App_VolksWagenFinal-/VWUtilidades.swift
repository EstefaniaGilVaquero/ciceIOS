//
//  VWUtilidades.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

let CONSTANTES = Constantes()

//MARK: - GET STRING
public func dimeString(j : JSON, nombre : String) ->String{
    if let stringResult = j[nombre].string{
        return stringResult
    }else{
        return ""
    }
}


//MARK: - GET INT
public func dimeInt(j : JSON, nombre : String) ->Int{
    if let intResult = j[nombre].int{
        return intResult
    }else{
        return 0
    }
}

//MARK: - GET DOUBLE
public func dimeDouble(j : JSON, nombre : String) ->Double{
    if let doubleResult = j[nombre].double{
        return doubleResult
    }else{
        return 0.0
    }
}

//MARK: - GET FLOAT
public func dimeFloat(j : JSON, nombre : String) ->Float{
    if let floatResult = j[nombre].float{
        return floatResult
    }else{
        return 0
    }
}

//MARK: - ALERT/VC
func showAlertVC (titleData : String, messageData : String) -> UIAlertController{
    let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
    return alertVC
}

//MARK: - REFRESH
func refreshFunction(tableView : UITableView, endRefreshTVC : UIRefreshControl){
    tableView.reloadData()
    endRefreshTVC.endRefreshing()
}

//MARK: - BASE URL DE IMAGENES
func getImagePath(nombreImagen : String) ->String {
    return CONSTANTES.BASE_FOTO_URL + nombreImagen
}



