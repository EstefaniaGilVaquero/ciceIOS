//
//  ViewController.swift
//  App_NavigationData
//
//  Created by formador on 1/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var variables = VariablesGlobales()

    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNombreTF: UITextField!
    @IBOutlet weak var myApellidoTF: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NAVEGACION
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Identificar el segue por el que estamos pasando
        if segue.identifier == "segueV2" {
            //Crear el objeto que representa el VC que recibe una vista DESTINO
            let ventana2VC = segue.destinationViewController as! ICSegundaVentanaViewController
            
            ventana2VC.variables.nombreData = myNombreTF.text
            ventana2VC.variables.apellidoData = myApellidoTF.text
        }
    }
    
    
    @IBAction func cerrarVC(segue: UIStoryboardSegue){
        
        print("Logout completado")
        
    }
    
    
    
    //MARK: - BAJAR EL TECLADO
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

