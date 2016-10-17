//
//  WWPostImageViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class WWPostImageViewController: UIViewController {
    
    var fotoSeleccionada = false

    @IBOutlet weak var myDescripcion: UITextField!
    @IBOutlet weak var myImagen: UIImageView!
    
    @IBAction func publicarImagen(sender: AnyObject) {
    }
    
    
    @IBAction func mostrarCamara(sender: AnyObject) {
        
        var errorData = ""
        
        if !fotoSeleccionada{
            errorData = "Por favor elige una foto de la galeria o toma una fotografia"
        }else if myDescripcion.text == "" {
            errorData = "Por favor introduce una breve descripcion de la imagen"
        }
        
        if errorData != ""{
            presentViewController(showAlartVC("Error en los datos", messageData: errorData), animated: true, completion: nil)
        }else{
            let postImage = PFObject(className: "Post")
            postImage["descripcionImagen"] = myDescripcion.text
            let imageData = UIImageJPEGRepresentation(self.myImagen.image!, 0.4)
            let imageFile = PFFile(name: (PFUser.currentUser()?.username!)! + "image.jpg", data: imageData!)
            
            //postImage["imageFileWW"] = ima
        }
        
        
        pickerPhoto()
    }
    
    @IBAction func cerrarSesion(sender: AnyObject) {
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
extension WWPostImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        myImagenPerfil.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

