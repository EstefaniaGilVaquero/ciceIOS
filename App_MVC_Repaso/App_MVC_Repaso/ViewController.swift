//
//  ViewController.swift
//  App_MVC_Repaso
//
//  Created by cice on 6/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myFirstName: UILabel!
    @IBOutlet weak var myLastName: UILabel!
    @IBOutlet weak var myAlias: UILabel!
    @IBOutlet weak var myTelefono: UILabel!
    @IBOutlet weak var myDireccion: UILabel!
    @IBOutlet weak var myCumpleanos: UILabel!
    @IBOutlet weak var myEmail: UILabel!
    @IBOutlet weak var myCV: UILabel!
    @IBOutlet weak var myDescripcion: UILabel!
    @IBOutlet weak var myImagen: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personaje = ICOPersonaje(aFirstName: "Manolo", aLastName: "El del bombo", aAlias: "Manolete", aTelefono: "91456783", aDireccion: "C/bombo", aCumpleanos: "28/07/1983", aEmail: "manoletebombete@gmail.com", aCv: "soy un crack", aBiografia: "blablalbalblalb",aImagen: UIImage(named: "manolo.jpg")!)
        
        
        myFirstName.text = personaje.firstName
        myLastName.text = personaje.lastName
        myAlias.text = personaje.alias
        myTelefono.text = personaje.telefono
        myDireccion.text = personaje.direccion
        myCumpleanos.text = personaje.cumpleanos
        myEmail.text = personaje.email
        myCV.text = personaje.cv
        myDescripcion.text = personaje.biografia
        myImagen.image = personaje.imagen
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

