//
//  DPContratosViewController.swift
//  AppCoreData_GDP
//
//  Created by cice on 19/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData

class DPContratosViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var CustomManagedObjectContext : NSManagedObjectContext?
    //let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    
    
    
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
    
    //MARK: - IBACTION
    
    @IBAction func salvarDatosEnCoreData(sender: AnyObject) {
        //3. //Creamos una entrada general a la base de Datos
        let newData = NSEntityDescription.insertNewObjectForEntityForName("Contratos", inManagedObjectContext: CustomManagedObjectContext!) as! Contratos
        //Aqui salvamos los datos
        //Opcion 1
        //newData.setValue(myNumeroFechaTF.text, forKey: "numeroFecha")
        //opcion 2
        //newData.setValuesForKeysWithDictionary(["numeroFecha" : myNumeroFechaTF.text!])
        //opcion 3
        newData.numeroFecha = myNumeroFechaTF.text
        newData.mesFecha = myMesFechaTF.text
        newData.nombreYApellido = myNombreYApellidoTF.text
        newData.nombreEmpresa = myNombreEmpresaTF.text
        newData.direccionEmpresa = myNombreEmpresaTF.text
        newData.despachoAbogados = myDespachoEmpresaTF.text
        newData.numeroColegiado1 = myNumeroColegiadoUnoTF.text
        newData.numeroColegiado2 = myNumeroColegiadoDosTF.text
        newData.observacionesGenerales = myObservacionesGeneralesTF.text
        newData.numeroCuenta = myNumeroCuentaCorrienteTF.text
        newData.numeroCaja = myNumeroCajaTF.text
        newData.nombreTitularCuenta = myNombreTitularCuentaTF.text
        
        //Guardamos los datos (save())
        do{
            try CustomManagedObjectContext?.save()
        }catch let error{
            print(error)
        }
        //try catch moderno, pero de esta manera en caso de error no se muestra bien en consola
       // _ = try! CustomManagedObjectContext?.save()
        
        myNumeroFechaTF.text = ""
        myMesFechaTF.text = ""
        myNombreYApellidoTF.text = ""
        myNombreEmpresaTF.text = ""
        myNombreEmpresaTF.text = ""
        myDespachoEmpresaTF.text = ""
        myNumeroColegiadoUnoTF.text = ""
        myNumeroColegiadoDosTF.text = ""
        myObservacionesGeneralesTF.text = ""
        myNumeroCuentaCorrienteTF.text = ""
        myNumeroCajaTF.text = ""
        myNombreTitularCuentaTF.text = ""
        
        print(newData)
        //print((NSBundle.mainBundle()))
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creamos la interface de conexion entre el modelo y el controlador
        let CustomappDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        CustomManagedObjectContext = CustomappDelegate.managedObjectContext

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

}
