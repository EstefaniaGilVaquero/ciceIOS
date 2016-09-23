//
//  ViewController.swift
//  APP_Socialmedia_Facebook_Twitter
//
//  Created by cice on 9/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    //mark: - IBOUTLET
    @IBOutlet weak var myBotonFacebookBTN: UIButton!
    @IBOutlet weak var myBotonTwitter: UIButton!
    @IBOutlet weak var myTextoLBL: UILabel!
    @IBOutlet weak var myImagenParaFacebook: UIImageView!
    
    
    //MARK: - IBCTION

    @IBAction func showCamera(sender: AnyObject) {
        pickerPhoto()
    }

    
    @IBAction func showMyActivityActionSheet(sender: AnyObject) {
        
        let textoCompartir = myTextoLBL.text
        let webCompartir = "http://www.andresocampo.com"
        let imagenCompartir = myImagenParaFacebook.image
        
        let compartir = UIActivityViewController(activityItems: [textoCompartir!,webCompartir,imagenCompartir!], applicationActivities: nil)
        presentViewController(compartir, animated: true, completion: nil)
        
        limpiaDatos()
        
        
    }
    
    
    @IBAction func postSocialMediaFacebook(sender: AnyObject) {
        //1 -> Comprobar la disponibilidad del framework
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            //2 -> Creamos el objeto
            let postInMyFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postInMyFacebook.setInitialText(myTextoLBL.text!)
            postInMyFacebook.addImage(myImagenParaFacebook.image!)
            postInMyFacebook.addURL(NSURL(string: "http:www.andresocampo.com"))
            presentViewController(postInMyFacebook, animated: true, completion: nil)
            
            print("se ha publicado correctamente")
            
        }else{
            showAlertVC("Cuenta de facebook", messageData: "Por favor haz login en facebook para compartir")
        }
        
        limpiaDatos()
    }
    
    @IBAction func postSocialMediaTwitter(sender: AnyObject) {
        //1 -> Comprobar la disponibilidad del framework
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            //2 -> Creamos el objeto
            let postInMyTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postInMyTwitter.setInitialText(myTextoLBL.text!)
            postInMyTwitter.addImage(myImagenParaFacebook.image!)
            postInMyTwitter.addURL(NSURL(string: "http:www.andresocampo.com"))
            presentViewController(postInMyTwitter, animated: true, completion: nil)
            
            print("se ha publicado correctamente")
            
        }else{
            showAlertVC("Cuenta de Twitter", messageData: "Por favor haz login en twitter para compartir")
        }
        
        limpiaDatos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myBotonFacebookBTN.setTitle("Facebook", forState: .Normal)
//        myBotonTwitter.setTitle("Twitter", forState: .Normal)
        
        //postInFacebook()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    func showAlertVC(titleData : String, messageData : String){
        let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    func postInFacebook(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            myBotonFacebookBTN.setTitle(("Puedes postear con Facebook"), forState: .Normal)
        }else{
            myBotonFacebookBTN.setTitle("No puedes postear con Facebook", forState: .Normal)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func limpiaDatos(){
        myTextoLBL.text = ""
        myImagenParaFacebook.image = UIImage(named: "placeholder")
    }
}

//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            showPhotoMenu()
        }else{
            choosePhotoFromLibrary()
        }
    }
    func showPhotoMenu(){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Tomar Foto", style: .Default) { Void in
            self.takePhotowithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Escoge de la Librería", style: .Default) { Void in
            self.choosePhotoFromLibrary()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(takePhotoAction)
        alertVC.addAction(chooseFromLibraryAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    func takePhotowithCamera(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func choosePhotoFromLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        myImagenParaFacebook.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

