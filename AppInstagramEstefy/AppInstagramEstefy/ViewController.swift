//
//  ViewController.swift
//  AppInstagramEstefy
//
//  Created by CICE on 26/9/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var objectIdData : String?
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNombreTXT: UITextField!
    @IBOutlet weak var myApellidoTXT: UITextField!
    @IBOutlet weak var myPuntuacionTXT: UITextField!
    @IBOutlet weak var myTelefonoTXT: UITextField!
    @IBOutlet weak var myDireccionTXT: UITextField!
    @IBOutlet weak var myCodigoPostal: UITextField!
    @IBOutlet weak var myEditBTN: UIButton!
    
    //MARK: - IBACTION
    
    @IBAction func editarRegistroBTN(sender: AnyObject) {
    }
    

    @IBAction func myRegistrarBTN(sender: AnyObject) {
        
        //Fase 1 -> Vamos a salvar datos de una puntuacion de un juego
        let userDataPuntuacion = PFObject(className: "PuntuacionCICEBird")

        
        
        userDataPuntuacion["nombre"] = myNombreTXT.text
        userDataPuntuacion["apellido"] = myApellidoTXT.text
        userDataPuntuacion["puntuacion"] = Int(myPuntuacionTXT.text!)
        userDataPuntuacion["telefono_movil"] = Int(myTelefonoTXT.text!)
        userDataPuntuacion["direccion"] = myDireccionTXT.text
        userDataPuntuacion["codigo_postal"] = myCodigoPostal.text
        
        userDataPuntuacion.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            
            if error != nil{
                print(error?.description)
            }else{
                print("El objeto Puntuacion CICE Bird se ha creado satisfactoriamente, y ademas el objeto userDataPuntuacion tiene un identificador \(userDataPuntuacion.objectId)")
                self.myNombreTXT.text = ""
                self.myApellidoTXT.text = ""
                self.myPuntuacionTXT.text = ""
                self.myTelefonoTXT.text = ""
                self.myDireccionTXT.text = ""
                self.myCodigoPostal.text = ""
            }
            
            self.objectIdData = userDataPuntuacion.objectId!
            
        }

    }
    
    //Fase 2 - Consultar y recuperar datos
    
    @IBAction func recuperarDatos(sender: AnyObject) {
        
        
        
        let query = PFQuery(className:"PuntuacionCICEBird")
        query.getObjectInBackgroundWithId(self.objectIdData!) { (PuntuacionCICEBird, error) in
            


        
            if error != nil{
                print(error?.description)
            }else{
                self.myNombreTXT.text = PuntuacionCICEBird!["nombre"]! as? String
              //  self.myTelefonoTXT.text = String(PuntuacionCICEBird!["telefono"]! as? Int)
                
                //Mostramos boton editar
                self.myEditBTN.hidden = false
            
            }
    
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myEditBTN.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

