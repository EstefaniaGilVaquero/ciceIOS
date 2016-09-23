//
//  ViewController.swift
//  App_ToucheID
//
//  Created by cice on 12/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import LocalAuthentication
//!Importacion del framework con el que obtenemos acceso a los objetos de biometrica

class ViewController: UIViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    //fundamentalmente evaluamos las politicas de Autenticacion, lo que permite a las aplicaciones solicitar dicha autenticacion(informacion personal)
    
    var customToucheID = LAContext()
    var messageDataText = "Necesito saber si eres tú"
    var nombre = "Estefi"
    
    var alertVC = UIAlertController(title: "", message: "", preferredStyle: .Alert)
    var alertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myMomentoAutenticacionLBL: UILabel!
    @IBOutlet weak var myComentarioAutenticacionLBL: UILabel!
    
    
    //MARK: - IBACTION
    
    @IBAction func desbloqueoTouchID(sender: AnyObject) {
        myMomentoAutenticacionLBL.text = "Autenticando..."
        var toucheIDError : NSError?
        
        //2- Comprobamos si podemos acceder a la autenticacion local del dispositivo, pasamos un puntero a la memoria del error -> posible errores de politica de autenticacion me muestre las raazones del por que ese fallo, asi el sistema nos puede proporcionar una respuesta adecuada
        
        if customToucheID.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &toucheIDError){
            
            //Comprobamos la respuesta de esa autenticacion
            customToucheID.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
                                          localizedReason: messageDataText,
                                          reply: {(success, error) in
            
            if success{
                self.myMomentoAutenticacionLBL.text = "TouchID exitoso"
                self.myComentarioAutenticacionLBL.text = "Has logrado demostrar que eres tu"
                self.alertVC.title = "Autenticacion Exitosa"
                self.alertVC.message = "Se que eres tu \(self.nombre)"
            }else{
                self.myMomentoAutenticacionLBL.text = "TouchID No exitoso"
                self.myComentarioAutenticacionLBL.text = "Has logrado demostrar que eres tu"
                self.alertVC.title = "La atutenticacion ha fallado"
                
                switch error!.code{
                case LAError.AuthenticationFailed.rawValue:
                    self.alertVC.message = "Fallo en la Autenticacion"
                case LAError.UserCancel.rawValue:
                    self.alertVC.message = "El sistema ha cancelado la Autenticacion"
                case LAError.UserFallback.rawValue:
                    self.alertVC.message = "Solicito que ingreses con la contraseña"
                default:
                    self.presentViewController(self.alertVC, animated: true, completion: { 
                        self.myComentarioAutenticacionLBL.text = self.messageDataText
                    })
                }
            }
        })
        }else{
            self.myMomentoAutenticacionLBL.text = "Autenticacion local ha Fallado"
            self.alertVC.title = "Ooooops!"
            
            switch toucheIDError!.code {
            case LAError.TouchIDNotAvailable.rawValue:
                self.alertVC.message = "No existe touchID en tu dispositivo"
            case LAError.TouchIDNotEnrolled.rawValue:
                self.alertVC.message = "No tienes huellas almacenadas"
            case LAError.PasscodeNotSet.rawValue:
                self.alertVC.message = "No hay contraseña asignada"
            default:
                self.alertVC.message = "Algo ha salido mal en la Autenticacion local"
                
            }
            
            self.presentViewController(alertVC, animated: true, completion: { 
                self.myComentarioAutenticacionLBL.text = self.alertVC.message
            })
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

