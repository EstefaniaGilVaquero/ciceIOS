//
//  ViewController.swift
//  App_internacionalizacion
//
//  Created by cice on 12/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextoLBL: UILabel!
    @IBOutlet weak var myFechaLBL: UILabel!
    @IBOutlet weak var myMonedaLBL: UILabel!
    @IBOutlet weak var myNumeroLBL: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dameValor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dameValor(){
        myTextoLBL.text = NSLocalizedString("GOOD_MORNING", comment: "Indicar que estoy gestionando diccionario")
        myNumeroLBL.text = "\(9.999)"
        myMonedaLBL.text = "\(50.001)"
        myFechaLBL.text = "\(NSDate())"
    }
    
//    func dameMensajeConAlertViewController(){
//        let alertVC = UIAlertController(title: NSLocalizedString("TITLE_DATA", comment: ""), message: NSLocalizedString("MESSAGE_DATA", comment: ""), preferredStyle: .Alert)
//        alertVC.addAction((UIAlertController))
//    
//    }


}

