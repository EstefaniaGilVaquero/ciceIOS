//
//  VWLoginViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 3/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4

class VWLoginViewController: UIViewController {
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myUsernameParseTF: UITextField!
    @IBOutlet weak var myPasswordParseTF: UITextField!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - IBACTION
    @IBAction func realizaLoginInParse(sender: AnyObject) {
        if myUsernameParseTF.text == "" || myPasswordParseTF.text == ""{
            showAlertVCFinal("Estimado usuario", mensajeData: "por favor rellene todo los campos")
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
                        self.showAlertVCFinal("ATENCION", mensajeData: errorString as String)
                    }else{
                        self.showAlertVCFinal("ATENCION", mensajeData: "Existe un error en el login")
                    }
                }
            })
        }
    }
    
    //TODO: - LOGIN CON FACEBOOK
    @IBAction func loginConFacebook(sender: AnyObject) {
        let permissions = ["public_profile"]
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                    self.performSegueWithIdentifier("saltarTabBarControllerFromLogin", sender: self)
                } else {
                    print("User logged in through Facebook!")
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        }
    }
    
    //TODO: - LOGOUT
    @IBAction func heHechoLogout(segue: UIStoryboardSegue){
        PFUser.logOutInBackgroundWithBlock { (error) in
            if error != nil{
                print("Error al hacer logout")
            }else{
                print("Logout Completado")
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.currentUser() != nil{
            self.performSegueWithIdentifier("saltarTabBarControllerFromLogin", sender: self)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(tituloData : String, mensajeData : String ){
        let alertVC = UIAlertController(title: tituloData, message: mensajeData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    

  

}
