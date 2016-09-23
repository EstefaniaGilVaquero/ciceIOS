//
//  DPSolucionesViewController.swift
//  AppCoreData_GDP
//
//  Created by formador on 14/9/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import MessageUI

class DPSolucionesViewController: UIViewController {
    
    //MARK: - IBACTION
    @IBAction func enviaMailNegociosInmobiliarios(sender: AnyObject) {
      
        let mailComposeVC = optimizacionMetodoConfiguracion("inversion", nombreCompletoFicheroConExtension: "inversion.pdf")
        if MFMailComposeViewController.canSendMail(){
            presentViewController(mailComposeVC, animated: true, completion: nil)
        }else{
            dameAlertVC("Error en el envio del mensaje", messageData: "No se ha logrado enviar correctamente el mail")
        }
    }
    
    @IBAction func enviaMailBackOffice(sender: AnyObject) {
        let mailComposeVC = optimizacionMetodoConfiguracion("backoffice", nombreCompletoFicheroConExtension: "backoffice.pdf")
        if MFMailComposeViewController.canSendMail(){
            presentViewController(mailComposeVC, animated: true, completion: nil)
        }else{
            dameAlertVC("Error en el envio del mensaje", messageData: "No se ha logrado enviar correctamente el mail")
        }
      
        
    }
    
    @IBAction func enviaMailOficinaDeProyectos(sender: AnyObject) {
        
        let mailComposeVC = optimizacionMetodoConfiguracion("proyectos", nombreCompletoFicheroConExtension: "proyectos.pdf")
        if MFMailComposeViewController.canSendMail(){
            presentViewController(mailComposeVC, animated: true, completion: nil)
        }else{
            dameAlertVC("Error en el envio del mensaje", messageData: "No se ha logrado enviar correctamente el mail")
        }
        
    }
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UTILS
    func dameAlertVC(titleData : String, messageData : String){
        let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    // Nivel de optimizacion JEDI
    func configuracionMailComposeVC(mailTorecipient : [String], mailSubject : String, nombreFichero : String, extensionFichero : String, mimeTypeData : String, fileNameData : String, mailMessageBody : String, myBoolean : Bool) -> MFMailComposeViewController{
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(mailTorecipient)
        mailComposeVC.setSubject(mailSubject)
        let pathData = NSBundle.mainBundle().pathForResource(nombreFichero, ofType: extensionFichero)
        
        let myDataPDF = NSData(contentsOfFile: pathData!)
        
//        var myDataPdf : NSData?
//        
//        do{
//            myDataPdf = try NSData(contentsOfFile: pathData!, options: .UncachedRead)
//        }catch let error as NSError{
//            print(error.description)
//        }
        
        mailComposeVC.addAttachmentData(myDataPDF!, mimeType: mimeTypeData, fileName: fileNameData)
        mailComposeVC.setMessageBody(mailMessageBody, isHTML: myBoolean)
        return mailComposeVC
        
    }
    
    //Nivel de optimizacion tipo SITH
    func optimizacionMetodoConfiguracion(nombreFicheroSinExtension : String, nombreCompletoFicheroConExtension : String) -> MFMailComposeViewController{
        let optimizacionMailVC = configuracionMailComposeVC([""],
                                                            mailSubject: "Este Flyer es para su conocimiento y confidencialididad",
                                                            nombreFichero: nombreFicheroSinExtension,
                                                            extensionFichero: "pdf",
                                                            mimeTypeData: "text/pdf",
                                                            fileNameData: nombreCompletoFicheroConExtension,
                                                            mailMessageBody: "Por favor envia este flyer con caracter Urgente",
                                                            myBoolean: false)
        return optimizacionMailVC
    }
    
}

//MARK: MAIL DELEGATE
extension DPSolucionesViewController : MFMailComposeViewControllerDelegate{
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

