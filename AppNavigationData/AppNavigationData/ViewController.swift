//
//  ViewController.swift
//  AppNavigationData
//
//  Created by cice on 1/6/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
        //Identificar el segue(secuencia) por el que estamos pasando
        if segue.identifier == "segueV2" {
            //Crear el objeto que representa el VC que recibe una vista DESTINO
            let ventana2VC : SBSegundaVentanaViewController = segue.destinationViewController as! SBSegundaVentanaViewController
            ventana2VC.nombreData = myNombreTF.text
            ventana2VC.apellidoData = myApellidoTF.text
        }
    }
    
    //MARK: - BAJAR EL TECLADO
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

