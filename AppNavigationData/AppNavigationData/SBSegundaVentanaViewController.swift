//
//  SBSegundaVentanaViewController.swift
//  AppNavigationData
//
//  Created by cice on 1/6/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class SBSegundaVentanaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var nombreData : String?
    var apellidoData : String?
    var insertNewAge : Int?
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNombreLBL: UILabel!

    @IBOutlet weak var myApellidoLBL: UILabel!
    
    @IBOutlet weak var myTelefonoMovilTF: UITextField!
    
    @IBOutlet weak var myDireccionTF: UITextField!
    
    @IBOutlet weak var myEdadPerroTF: UITextField!
    
    @IBOutlet weak var myEdadPerroLBL: UILabel!
    
    //MARK: IBACTION
    
    @IBAction func myButtonCalculaEdad(sender: AnyObject) {
        
        insertNewAge = Int(myEdadPerroTF.text!)
        
        if insertNewAge != nil{
            let showNewAge = insertNewAge! * 7
            myEdadPerroLBL.text = "La edad de tu perro en años humanos es: \(showNewAge)"
        }else{
            
            self.presentViewController(showDisplayAlertControllerSB("hey", messagePara: "Introduce la edad de tu perrooooooooo gañannn!"), animated: true, completion: nil)
     
        }
        
    }
    
override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //cargamos los label con la info que llega del seue
        myNombreLBL.text = nombreData
        myApellidoLBL.text = apellidoData
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NAVEGACION
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Identificar el segue(secuencia) por el que estamos pasando
        if segue.identifier == "segueV3" {
            //Controlar si ha introducido todos los datos y calculado la edad del perro
            //Si no, mensaje de alerta
            if myTelefonoMovilTF.text == "" && myDireccionTF.text == "" || myEdadPerroTF.text == "" || myEdadPerroLBL.text == ""{
                self.presentViewController(showDisplayAlertControllerSB("hey", messagePara: "Introduce todos los datos y calcula la edad de tu Perro!"), animated: true, completion: nil)
            }else{
                //Si los ha introducido y calculado la edad del perro va a la ventana 3
                let ventana3VC = segue.destinationViewController as! SBTerceraVentanaViewController
                ventana3VC.nombreData = myNombreLBL.text
                ventana3VC.apellidoData = myApellidoLBL.text
                ventana3VC.direccionData = myDireccionTF.text
                ventana3VC.telefonoMovilData = myTelefonoMovilTF.text
                ventana3VC.edadPerroData = myEdadPerroLBL.text

            }
        }
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
