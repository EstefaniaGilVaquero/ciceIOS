//
//  ViewController.swift
//  App_MVC_Repaso
//
//  Created by cice on 6/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: VARIABLES LOCALES GLOBALES
    
    let datosPersonaje = DatosModel(pNombre: "Estefi", pApellido: "Gil", pMovil: 1234567, pDireccion: "Quero 77", pEmail: "stefy83@gmail.com",
                                    pLoremIpsum: "blablalbalblalblalb", pFotoPerfil: UIImage(named:"manolo.jpg")!, pUrlWebSite: NSURL(string: "https://trakt.tv/")!)
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myMovilLBL: UILabel!
    @IBOutlet weak var myDireccionLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLoremLBL: UILabel!
    @IBOutlet weak var myImageIV: UIImageView!
    @IBOutlet weak var myVisitasSitioWebBUTTON: UIButton!

    
    //MARK: - IBACTION
    
    @IBAction func ShowSitioWebACTION(sender: AnyObject) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNombreLBL.text = datosPersonaje.nombre
        myApellidoLBL.text = datosPersonaje.apellido
        myMovilLBL.text = "\"datosPersonaje.movil"
        myDireccionLBL.text = datosPersonaje.direccion
        myEmailLBL.text = datosPersonaje.email
        myLoremLBL.text = datosPersonaje.loremIpsum
        myImageIV.image = datosPersonaje.fotoPerfil
        
        myVisitasSitioWebBUTTON.layer.cornerRadius = 5
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NAVIGATION
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWebSite"{
            let showWebSiteVC = segue.destinationViewController as! WebViewController
            showWebSiteVC.enlaceWebSite = datosPersonaje.urlWebSite
        }
    }


}

