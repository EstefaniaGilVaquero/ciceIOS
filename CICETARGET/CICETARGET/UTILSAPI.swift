//
//  UTILSAPI.swift
//  CICETARGET
//
//  Created by formador on 25/5/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import Foundation
import UIKit
import MessageUI


//MARK: - UTILS
func configuredMailComposeVC(myArray : [String], myString : String) -> MFMailComposeViewController {
    let mailComposeVC = MFMailComposeViewController()
    mailComposeVC.setToRecipients(myArray)
    mailComposeVC.setSubject(myString)
    mailComposeVC.setMessageBody("Enviar una prueba esto no es un Phising", isHTML: false)
    return mailComposeVC
}

func showSendMailErrorAlertVC() -> UIAlertController{
    let alertVC = UIAlertController(title: "ATENCIÓN", message: "El mail no se ha logrado envir correctamente" , preferredStyle: .Alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    return alertVC
}


