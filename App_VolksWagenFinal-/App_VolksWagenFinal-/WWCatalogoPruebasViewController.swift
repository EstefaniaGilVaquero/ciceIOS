//
//  WWCatalogoPruebasViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 6/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWCatalogoPruebasViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayCatalogoPruebasData : WWCatalogoPruebas?
    var CONSTANTES = Constantes()
    
    //MARK: - IBOUTLET
    

    @IBOutlet weak var myImagenCocheCatalogo: UIImageView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myNombreOfertaCoche: UILabel!
    @IBOutlet weak var myCombustibleCoche: UILabel!
    @IBOutlet weak var myCilindradaCoche: UILabel!
    @IBOutlet weak var myPotenciaCoche: UILabel!
    
    //MARK: - IBACTION
    
    @IBAction func showAlertConfirmacionPrueba(sender: AnyObject) {
        presentViewController(showAlartVC("Estimado usuario", messageData: "Su solicitud de prueba a sido confirmada"), animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myScrollView.contentSize = CGSizeMake(320, 900)
        
        myNombreOfertaCoche.text = arrayCatalogoPruebasData?.NombreModelo
        myCombustibleCoche.text = arrayCatalogoPruebasData?.Combustible
        myCilindradaCoche.text = String(arrayCatalogoPruebasData!.Cilindrada!)
        myPotenciaCoche.text = String(arrayCatalogoPruebasData!.KW!)
        
        //Tratamiento de imagen
        let myImagenCocheCatalogoData = arrayCatalogoPruebasData?.Imagen
        let myImageUrl = NSURL(string: getImagePath(myImagenCocheCatalogoData!))
        let myImageData = NSData(contentsOfURL: myImageUrl!)
        myImagenCocheCatalogo.image = UIImage(data: myImageData!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
