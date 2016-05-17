//
//  SYEdadPerroViewController.swift
//  FotosEdadPerroHolaMundo
//
//  Created by cice on 11/5/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYEdadPerroViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var insertNewAge : Int?
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myTxtInsertaEdad: UITextField!
    @IBOutlet weak var myEdadPerroLBL: UILabel!
    //MARK: - IBACTION
    
    @IBAction func myButtonCalculaEdad(sender: AnyObject) {
        
       insertNewAge = Int(myTxtInsertaEdad.text!)
        
        if insertNewAge != nil{
            let showNewAge = insertNewAge! * 7
            myEdadPerroLBL.text = "La edad de tu perro en años humanos es: \(showNewAge)"
        }else{
            displayAVC()
        }
        
        myTxtInsertaEdad.text = ""
    }

    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayAVC(){
        let alertVC = UIAlertController(title: "hey", message: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(alertAction)
        presentViewController(alertVC, animated: true, completion: nil)
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
