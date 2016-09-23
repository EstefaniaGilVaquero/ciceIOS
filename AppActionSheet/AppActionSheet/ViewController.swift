//
//  ViewController.swift
//  AppActionSheet
//
//  Created by cice on 18/5/16.
//  Copyright © 2016 L'Epic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let imageFacebook = UIImage(named: "facebook@2x.png")
    let imageTwitter = UIImage(named: "icon.twitter@2x.png")
    let imageLinkedIn = UIImage(named: "linkedin@2x.png")
    let imageCamera = UIImage(named: "iconCamera@2x.png")
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var logingTextField : UITextField?
    var passwordTextField : UITextField?
    
    
    //MARK: - IBACTION
    
    @IBAction func showSocialNetworks(sender: AnyObject) {
        
        

        
        let alertAS = UIAlertController(title: "UIActionSheet", message: "Con que red social quieres conectar?", preferredStyle: .ActionSheet)
        
        let facebook = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
        let linkedIn = UIAlertAction(title: "linkedIn", style: .Default, handler: nil)
        let Twitter = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
        let Tinder = UIAlertAction(title: "Tinder", style: .Default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let delete = UIAlertAction(title: "Delete", style: .Destructive, handler: nil)
        
        facebook.setValue(imageFacebook, forKey: "image")
        linkedIn.setValue(imageLinkedIn, forKey: "image")
        Twitter.setValue(imageTwitter, forKey: "image")
        
        alertAS.addAction(facebook)
        alertAS.addAction(linkedIn)
        alertAS.addAction(Twitter)
        alertAS.addAction(Tinder)
        alertAS.addAction(cancelAction)
        alertAS.addAction(delete)
        
        presentViewController(alertAS, animated: true, completion: nil)

    }
    
    
    @IBAction func showPicOptions(sender: AnyObject) {
        let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Opciones de Fotos", preferredStyle: .ActionSheet)
        
        let botonTakePhoto = UIAlertAction(title: "Take Pic", style: .Default, handler: { (alert) in
            //print("Boton OK presionado")
            self.takePhotoWithCamera()
        })
        let botonOpenGallery = UIAlertAction(title: "Open Gallery", style: .Default, handler: { (alert) in
            //print("Hola")
            self.choosePhotoFromLibrary()
        })
        
        alertVC.addAction(botonTakePhoto)
        alertVC.addAction(botonOpenGallery)
        
        botonTakePhoto.setValue(imageCamera, forKey: "image")
        botonOpenGallery.setValue(imageCamera, forKey: "image")

    
        presentViewController(alertVC, animated: true, completion: nil)
    
    
    }
    
    @IBAction func alertControllACTION(sender: AnyObject) {
        
        if sender.tag == 0{
            
            //insertar un AlertController simple
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller es la presentacion por Defecto", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert) in
                print("Boton cancrel presionado")
            })
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                print("Boton OK presionado")
            })
            
            alertVC.addAction(cancelAction)
            alertVC.addAction(okAction)

            presentViewController(alertVC, animated: true, completion: nil)
            
        }else if sender.tag == 1{
            
            let alertVCTF = UIAlertController(title: "UIAlertController", message: "UiAlertController con un TextField", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                print("Boton OK presionado")
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert) in
                print("Hola")
            })
            
            alertVCTF.addAction(okAction)
            alertVCTF.addAction(cancelAction)
            
            alertVCTF.addTextFieldWithConfigurationHandler({ (textField) in
                self.logingTextField = textField
                self.logingTextField?.placeholder = "Introduce tu LogIn"
            })
            
            
            
            presentViewController(alertVCTF, animated: true, completion: nil)
            
        }else if sender.tag == 2{
            
            
            let alertVCTF = UIAlertController(title: "UIAlertController", message: "UiAlertController con un TextField", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                print("Boton OK presionado")
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert) in
                print("Hola")
            })
            
            alertVCTF.addAction(okAction)
            alertVCTF.addAction(cancelAction)
            
            alertVCTF.addTextFieldWithConfigurationHandler({ (textField) in
                self.logingTextField = textField
                self.logingTextField?.placeholder = "Introduce tu LogIn"
            })
            
            alertVCTF.addTextFieldWithConfigurationHandler({ (textField) in
                self.passwordTextField = textField
                self.passwordTextField?.placeholder = "Introduce tu password"
                self.passwordTextField?.secureTextEntry = true
                
            })
            
            
            presentViewController(alertVCTF, animated: true, completion: nil)
            
            
        }else if sender.tag == 3{
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller es la presentacion por Defecto", preferredStyle: .Alert)
            
            let botonUno = UIAlertAction(title: "Uno", style: .Default, handler: { (alert) in
                //print("Boton OK presionado")
                self.takePhotoWithCamera()
            })
            let botonDos = UIAlertAction(title: "Dos", style: .Default, handler: { (alert) in
                //print("Hola")
                self.choosePhotoFromLibrary()
            })
            
            let botonTres = UIAlertAction(title: "Tres", style: .Default, handler: { (alert) in
                print("Boton OK presionado")
            })
            let bontonCuatro = UIAlertAction(title: "Cuatro", style: .Default, handler: { (alert) in
                print("Hola")
            })
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (alert) in
                print("Boton cancrel presionado")
            })
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                print("Boton OK presionado")
            })
            
            alertVC.addAction(botonUno)
            alertVC.addAction(botonDos)
            alertVC.addAction(botonTres)
            alertVC.addAction(bontonCuatro)
            alertVC.addAction(cancelAction)
            alertVC.addAction(okAction)
            
            
            presentViewController(alertVC, animated: true, completion: nil)
            
            
        }else if sender.tag == 4{
            
            let alertAS = UIAlertController(title: "UIActionSheet", message: "esta es otra manera de dar opciones al usuario", preferredStyle: .ActionSheet)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            let delete = UIAlertAction(title: "Delete", style: .Destructive, handler: nil)
            
            alertAS.addAction(okAction)
            alertAS.addAction(cancelAction)
            alertAS.addAction(delete)
            
            presentViewController(alertAS, animated: true, completion: nil)
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

//MARK: - PROTOCOLO DELEGADO UIMAGEPICKERVIEW - UINAVIGATION CONTROLLER

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func takePhotoWithCamera()
    {
        let imagePC = UIImagePickerController()
        imagePC.sourceType = .Camera
        imagePC.delegate = self
        imagePC.allowsEditing = true
        presentViewController(imagePC, animated: true, completion: nil)
        
        //Guardar imagen

    }
   
    func choosePhotoFromLibrary(){
        
        let imagePC = UIImagePickerController()
        imagePC.sourceType = .Camera
        imagePC.delegate = self
        imagePC.allowsEditing = true
        presentViewController(imagePC, animated: true, completion: nil)
    }
}


























