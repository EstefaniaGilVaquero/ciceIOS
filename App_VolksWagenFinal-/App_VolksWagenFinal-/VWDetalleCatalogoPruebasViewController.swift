//
//  VWDetalleCatalogoPruebasViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWDetalleCatalogoPruebasViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayCatalogoData : VWCatalogoPruebasModel?
    let CONSTANTES = Constantes()
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNombreOfertaCoche: UILabel!
    @IBOutlet weak var myCombustibleCoche: UILabel!
    @IBOutlet weak var myCilindradaCoche: UILabel!
    @IBOutlet weak var myPotenciaCoche: UILabel!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImagenCocheCatalogo: UIImageView!
    
    
    //MARK: - IBACTION
    @IBAction func showAlertSolicitudPruebaACTION(sender: AnyObject) {
        presentViewController(showAlertVC("Estimado usuario", messageData: "Su solicitud de prueba ha sido enviada correctamente, en breve recibirá un correo notificándole su día y hora de prueba del coche"), animated: true, completion: nil)
    }
    
   
    @IBAction func showVCGaleriaImagenes(sender: AnyObject) {
        let galeriaImagenes = self.storyboard?.instantiateViewControllerWithIdentifier("galeria") as! VWGaleriaImagenesCochesViewController
        presentViewController(galeriaImagenes, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myScrollView.contentSize = CGSizeMake(320, 670)
        
        //SETTER DE LAS PROPIEDADES
        myNombreOfertaCoche.text = arrayCatalogoData?.NombreModelo
        myCombustibleCoche.text = arrayCatalogoData?.Combustible
        myCilindradaCoche.text = "\(arrayCatalogoData!.Cilindrada!)"
        myPotenciaCoche.text = String(arrayCatalogoData!.KW!)
        //Setter de la Imagen
        let myImagenCocheCatalogoData = arrayCatalogoData?.Imagen
        let myImagenUrl = NSURL(string: getImagePath(myImagenCocheCatalogoData!))
        let myImageData = NSData(contentsOfURL: myImagenUrl!)
        myImagenCocheCatalogo.image = UIImage(data: myImageData!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
