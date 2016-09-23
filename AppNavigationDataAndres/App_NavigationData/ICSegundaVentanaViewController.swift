//
//  ICSegundaVentanaViewController.swift
//  App_NavigationData
//
//  Created by formador on 1/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICSegundaVentanaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var edadPerro : Int?
    var variables = VariablesGlobales()
    

    //MARK: - IBOUTLET
    @IBOutlet weak var myNomnbreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    
    @IBOutlet weak var myTelefonoMovilTF: UITextField!
    @IBOutlet weak var myDireccionTF: UITextField!
    @IBOutlet weak var myCalculaEdadPerroTf: UITextField!
    
    @IBOutlet weak var myShowCalculaEdadPerro: UILabel!
    
    //MARK: - IBACTION
    @IBAction func calculaEdadPerro(sender: AnyObject) {
        edadPerro = Int(myCalculaEdadPerroTf.text!)
        if let edadDeMiPerro = edadPerro{
            let nuevaEdadPerro = edadDeMiPerro * 7
            myShowCalculaEdadPerro.text = "La edad de mi perro es \(nuevaEdadPerro)"
        }else{
            presentViewController(displayAlertVC("Hey", messageData:  "Por favor introduce la edad de tu perro"), animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myNomnbreLBL.text = variables.nombreData
        myApellidoLBL.text = variables.apellidoData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "segueV3"{
            if myTelefonoMovilTF.text == "" && myDireccionTF.text == "" && myShowCalculaEdadPerro.text == ""{
                presentViewController(displayAlertVC("Hey", messageData: "Por favor introduce los datos requeridos"), animated: true, completion: nil)
            }else{
                let ventanaV3 = segue.destinationViewController as! ICTerceraVentanaViewController
                ventanaV3.variables.nombreData = self.myNomnbreLBL.text
                ventanaV3.variables.apellidoData = self.myApellidoLBL.text
                ventanaV3.variables.telefonoMovilData = self.myTelefonoMovilTF.text
                ventanaV3.variables.direccionData = self.myDireccionTF.text
                ventanaV3.variables.edadPerroData = self.myShowCalculaEdadPerro.text
            }
        }
        
        
    }
    
    
    
    //MARK: - BAJAR EL TECLADO
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
