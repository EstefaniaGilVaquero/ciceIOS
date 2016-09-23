//
//  DPDetalleContratoViewController.swift
//  AppCoreData_GDP
//
//  Created by CICE on 21/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData

class DPDetalleContratoViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var contratoSeleccionado : Contratos!
    var customManagerContextObject : NSManagedObjectContext?
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNumeroFechaTF: UITextField!
    @IBOutlet weak var myMesFechaTF: UITextField!
    @IBOutlet weak var myNombreYApellidoTF: UITextField!
    @IBOutlet weak var myNombreEmpresaTF: UITextField!
    @IBOutlet weak var myDireccionEmpresaTF: UITextField!
    @IBOutlet weak var myDespachoEmpresaTF: UITextField!
    @IBOutlet weak var myNumeroColegiadoUnoTF: UITextField!
    @IBOutlet weak var myNumeroColegiadoDosTF: UITextField!
    @IBOutlet weak var myObservacionesGeneralesTF: UITextView!
    @IBOutlet weak var myNumeroCuentaCorrienteTF: UITextField!
    @IBOutlet weak var myNumeroCajaTF: UITextField!
    @IBOutlet weak var myNombreTitularCuentaTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        customManagerContextObject = customAppDelegate.managedObjectContext
        initSetup()

        // Do any additional setup after loading the view.
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
    
    //MARK: - UTILS
    func initSetup(){
        myNumeroFechaTF.text = contratoSeleccionado.numeroFecha
//        myNumeroFechaTF.text
//        myMesFechaTF.text
//        myNombreYApellidoTF.text
//        myNombreEmpresaTF.text
//        myDireccionEmpresaTF.text
//        myDespachoEmpresaTF.text
//        myNumeroColegiadoUnoTF.text
//        myNumeroColegiadoDosTF: UITextField!
//        myObservacionesGeneralesTF: UITextView!
//        myNumeroCuentaCorrienteTF: UITextField!
//        myNumeroCajaTF: UITextField!
//        myNombreTitularCuentaTF: UITextField!
        
        
        
    }

}

