//
//  VWPostImageViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWPostImageViewController: UIViewController {
    
    //MARK: - VARIABLE LOCAL GOBAL
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myDescripcionImagen: UITextField!
    @IBOutlet weak var myImagenPost: UIImageView!
    
    //MARK: - IBACTION
    @IBAction func publicarImagenPARSE(sender: AnyObject) {
        var errorData = ""
        
        if !fotoSeleccionada{
            errorData = "Por favor elige una foto de la galeria o toma una fotografia"
        }else if myDescripcionImagen.text == ""{
            errorData = "Por favor introduce una breve descripcion de la imagen"
        }
        
        if errorData != ""{
            presentViewController(showAlertVC("Error en los datos", messageData: errorData), animated: true, completion: nil)
        }else{
            //TODO: - OK
            let postImage = PFObject(className: "PostImagenVW")
            let imageData = UIImageJPEGRepresentation(self.myImagenPost.image!, 0.1)
            let imageFile = PFFile(name: "image.jpg", data: imageData!)
            
            postImage["imageFileVW"] = imageFile
            postImage["username"] = PFUser.currentUser()?.username
            postImage["descripcionImagen"] = myDescripcionImagen.text
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            postImage.saveInBackgroundWithBlock({ (subidaExitosaFoto, errorSubidaFoto) in
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                if subidaExitosaFoto{
                    self.presentViewController(showAlertVC("Estimado usuario", messageData: "se ha logrado subir exitosamente la foto"), animated: true, completion: nil)
                }else{
                    self.presentViewController(showAlertVC("Estimado usuario", messageData: "no se la logado subir la imagen"), animated: true, completion: nil)
                }
                self.fotoSeleccionada = false
                self.myDescripcionImagen.text = ""
                self.myImagenPost.image = UIImage(named: "placeholder")
            })
        }
    }
    
    
    @IBAction func muestraCamaraFotos(sender: AnyObject) {
        pickerPhoto()
    }
    
    @IBAction func cerrarSesion(sender: AnyObject) {
        self.performSegueWithIdentifier("logout", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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


//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension VWPostImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        let takePhotoAction = UIAlertAction(title: "Tomar Foto", style: .Default) { Void  in
            self.takePhotowithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Escoge de la Librería", style: .Default) { Void  in
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
        fotoSeleccionada = true
        myImagenPost.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
