//
//  ICCuartaVenetanaViewController.swift
//  App_NavigationData
//
//  Created by formador on 3/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit
import MessageUI

class ICCuartaVenetanaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var variables = VariablesGlobales()
 
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myTelefonoMovilLBL: UILabel!
    @IBOutlet weak var myDireccionLBL: UILabel!
    @IBOutlet weak var myEdadPerrilloLBL: UILabel!
    @IBOutlet weak var myCodigoPostalLBL: UILabel!
    @IBOutlet weak var myCiudadLBL: UILabel!
    @IBOutlet weak var myPosicionGeograficaLBL: UILabel!
    @IBOutlet weak var myFechaYHoraTF: UITextField!
 
    //MARK: - IBACTION
    @IBAction func logout(sender: AnyObject) {
        performSegueWithIdentifier("logout", sender: self)
    }
    
    @IBAction func showDatePicker(sender: UITextField) {
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .DateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector(pickerDateValueChanged(datePickerView, myTextField : myFechaYHoraTF)), forControlEvents: .ValueChanged)
        
    }
    
    
    @IBAction func sendMailToRecipient(sender: AnyObject) {
        
        let mailComposeVC = configuredMailComposeVC()
        if MFMailComposeViewController.canSendMail(){
            presentViewController(mailComposeVC, animated: true, completion: nil)
        }else{
            presentViewController(displayAlertVC("hew", messageData: "No se ha logrado enviar el mail"), animated: true, completion: nil)
        }
        
    }
    
    func configuredMailComposeVC() -> MFMailComposeViewController{
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients([""])
        mailCompose.setSubject("")
        
        let emailBody = "Nombre: \(myNombreLBL.text) \n Apellido: \(myApellidoLBL.text) \n Telefono Movil: \(myTelefonoMovilLBL.text)"
        
        mailCompose.setMessageBody(emailBody, isHTML: false)
        return mailCompose
    }
    
    //MARK: - CICLO DE VIDA DEL VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //TODO: - SE PINTAN LOS DATOS
        myNombreLBL.text = variables.nombreData
        myApellidoLBL.text = variables.apellidoData
        myTelefonoMovilLBL.text = variables.telefonoMovilData
        myDireccionLBL.text = variables.direccionData
        myEdadPerrilloLBL.text = variables.edadPerroData
        myCodigoPostalLBL.text = variables.codigoPostalData
        myCiudadLBL.text = variables.ciudadData
        myPosicionGeograficaLBL.text = variables.posicionGeograficaData

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ICCuartaVenetanaViewController : MFMailComposeViewControllerDelegate{
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
