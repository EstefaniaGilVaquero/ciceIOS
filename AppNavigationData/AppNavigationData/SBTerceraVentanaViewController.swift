//
//  SBTerceraVentanaViewController.swift
//  AppNavigationData
//
//  Created by cice on 3/6/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class SBTerceraVentanaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var nombreData : String?
    var apellidoData : String?
    var telefonoMovilData : String?
    var direccionData : String?
    var edadPerroData : String?
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNombre2LBL: UILabel!

    @IBOutlet weak var myApellido2LBL: UILabel!
    
    @IBOutlet weak var myTelefonoMovil2LBL: UILabel!
    
    @IBOutlet weak var myDireccion2LBL: UILabel!
    
    @IBOutlet weak var myEdadPerro2LBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Cargamos las vistas con la info que llega del segue
        myNombre2LBL.text = nombreData
        myApellido2LBL.text = apellidoData
        myTelefonoMovil2LBL.text = telefonoMovilData
        myDireccion2LBL.text = direccionData
        myEdadPerro2LBL.text = edadPerroData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - BAJAR EL TECLADO
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
