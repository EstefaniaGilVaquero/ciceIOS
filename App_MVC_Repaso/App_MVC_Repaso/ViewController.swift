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
    
    let datosPersonaje = DatosModel(pNombre: "Estefi",
                                    pApellido: "Gil",
                                    pMovil: 697254825,
                                    pDireccion: "Quero 77",
                                    pEmail: "stefy83@gmail.com",
                                    pLoremIpsum: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
                                    pFotoPerfil: UIImage(named:"manolo.jpg")!,
                                    pUrlWebSite: NSURL(string: "https://trakt.tv/")!)
    
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNombreLBL.text = datosPersonaje.nombre
        myApellidoLBL.text = datosPersonaje.apellido
        myMovilLBL.text = "\(datosPersonaje.movil!)"
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

