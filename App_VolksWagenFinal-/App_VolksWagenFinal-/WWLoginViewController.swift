//
//  WWLoginViewController.swift
//  
//
//  Created by CICE on 3/10/16.
//
//

import UIKit
import Parse

class WWLoginViewController: UIViewController {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myUsernameParseTF: UITextField!
    @IBOutlet weak var myPasswordParseTF: UITextField!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!

    
    //MAARK: - IBACTION
    
    @IBAction func realizarLoginInParse(sender: AnyObject) {
        
        if myUsernameParseTF.text == "" || myPasswordParseTF.text == "" {
            showAlertVCFinal("ATENCION", mensageData: "Por favor rellene todos los campos")
        }else{
            myActivityIndicator.hidden = false
            myActivityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            PFUser.logInWithUsernameInBackground(myUsernameParseTF.text!, password: myPasswordParseTF.text!, block: { (userFromParse, errorLogin) in
                
                self.myActivityIndicator.hidden = true
                self.myActivityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if userFromParse != nil{
                    self.performSegueWithIdentifier("saltarTabBarControllerFromLogin", sender: self)
                }else{
                    if let errorString = errorLogin!.userInfo["error"] as? NSString{
                        self.showAlertVCFinal("ATENCION", mensageData: errorString as String)
                    }else{
                        self.showAlertVCFinal("ATENCION", mensageData: "Existe un error en el login")
                    }
                }
           })
            
        }
        
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(tituloData : String, mensageData : String){
        let alertVC = UIAlertController(title: tituloData, message: mensageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.hidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("saltarTabBarControllerFromLogin", sender: self)
        }
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
