//
//  CCDescripcionAppViewController.swift
//  CICETARGET
//
//  Created by formador on 23/5/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit
import MessageUI

class CCDescripcionAppViewController: UIViewController {
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myWebView: UIWebView!
    
    
    //MARK: - IBACTION
    @IBAction func volverACTION(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: - IBACTION ENVIO MAIL
    @IBAction func sendMailToSuportTeam(sender: AnyObject) {
        let mailComposeVC = configuredMailComposeVC([""], myString: "")
        mailComposeVC.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail(){
            presentViewController(mailComposeVC, animated: true, completion: nil)
        }else{
            showSendMailErrorAlertVC()
        }
    }
    
    //MARK: - CICLO DE VIDA DEL VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("target", ofType: "html"){
            let fileHtml = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            myWebView.loadData(fileHtml!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

//MARK: - DELEGADO DE MFMAIL_VC
extension CCDescripcionAppViewController : MFMailComposeViewControllerDelegate{
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}










