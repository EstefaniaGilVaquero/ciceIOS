//
//  VWRegistroNuevoUsuarioViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 3/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWRegistroNuevoUsuarioViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var fotoSeleccionada = false
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myUsernameTF: UITextField!
    @IBOutlet weak var myPasswordTF: UITextField!
    @IBOutlet weak var myNombreUsuarioTF: UITextField!
    @IBOutlet weak var myApellidoUsuarioTF: UITextField!
    @IBOutlet weak var myEmailUsuarioTF: UITextField!
    @IBOutlet weak var myMovilusuarioTF: UITextField!
    @IBOutlet weak var myLocalidadUsuarioTF: UITextField!
    @IBOutlet weak var myAsociacionUsuarioTF: UITextField!
    
    //MARK: - IBACTION
    @IBAction func myRegistroNuevoUsuarioACTION(sender: AnyObject) {
        var errorInicial = ""
        if myUsernameTF.text == "" || myPasswordTF.text == "" || myNombreUsuarioTF.text == "" || myApellidoUsuarioTF.text == "" || myLocalidadUsuarioTF.text == "" || myAsociacionUsuarioTF.text == "" || myImagenPerfil.image == nil{
            errorInicial = "Estimado usuario por favor rellene todos los campos"
        }else{
            //la instancia para interactuar con "parse"
            let user = PFUser()
            user.username = myUsernameTF.text
            user.password = myPasswordTF.text
            user["nombre"] = myNombreUsuarioTF.text
            user["apellido"] = myApellidoUsuarioTF.text
            user.email = myEmailUsuarioTF.text
            user["movilUsuario"] = myMovilusuarioTF.text
            user["localidad"] = myLocalidadUsuarioTF.text
            user["asociacion"] = myAsociacionUsuarioTF.text
            myActivityIndicator.hidden = false
            myActivityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            user.signUpInBackgroundWithBlock({ (success, singUpError) in
                self.myActivityIndicator.hidden = true
                self.myActivityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                let errorDataSingUp = singUpError
                var errorDataPost = ""
                    if !self.fotoSeleccionada{
                        errorDataPost = "por favor selecciona una imagen para registrarte"
                    }
                    if errorDataSingUp != nil{
                        if let errorString = errorDataSingUp!.userInfo["error"] as? NSString{
                             self.showAlertVCFinal("ATENCION", mensajeData: errorString as String)
                        }else{
                             self.showAlertVCFinal("ATENCION", mensajeData: "Existe un error en el registro")
                        }
                    }else{
                       //metodo de salvar imagen
                        self.singUpConFoto()
                    }
            })
        }
        if errorInicial != ""{
            showAlertVCFinal("ATENCIÓN", mensajeData: errorInicial)
        }
    }
    
    @IBAction func ocultarVCACTION(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(tituloData : String, mensajeData : String ){
        let alertVC = UIAlertController(title: tituloData, message: mensajeData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    //MARK: - SUBIR FOTO A PARSE CON EL REGISTRO
    func singUpConFoto(){
        //instancia de la imagen a subir
        let postImage = PFObject(className: "ImageProfile")
        let imageData = UIImageJPEGRepresentation(self.myImagenPerfil.image!, 0.4)
        let imageFile = PFFile(name: "imagePerfilUsuario.jpg", data: imageData!)
        postImage["imageFile"] = imageFile
        postImage["username"] = PFUser.currentUser()?.username
        postImage.saveInBackgroundWithBlock { (success, error) in
            if success{
                self.showAlertVCFinal("ATENCION", mensajeData: "DATOS SALVADOS SATISFACTORIAMENTE")
            }else{
                self.showAlertVCFinal("ATENCION", mensajeData: "Error en el registro")
            }
            self.fotoSeleccionada = false
            self.myImagenPerfil.image = UIImage(named:"placeholder")
        }
        
        self.performSegueWithIdentifier("saltarTabBarController", sender: self)
        
        print("El usuario ha logrado registrarse")
        self.myUsernameTF.text = ""
        self.myPasswordTF.text = ""
        self.myNombreUsuarioTF.text = ""
        self.myApellidoUsuarioTF.text = ""
        self.myEmailUsuarioTF.text = ""
        self.myAsociacionUsuarioTF.text = ""
        self.myLocalidadUsuarioTF.text = ""
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator.hidden = true
        myImagenPerfil.userInteractionEnabled = true
        let tocaImagen = UITapGestureRecognizer(target: self, action: #selector(VWRegistroNuevoUsuarioViewController.muestraPickerPhoto))
        myImagenPerfil.addGestureRecognizer(tocaImagen)
        
        if PFUser.currentUser() != nil{
            self.performSegueWithIdentifier("saltarTabBarController", sender: self)
        }

        // Do any additional setup after loading the view.
    }
    
    //MARK: - LLAMADA PICKER PHOTO
    func muestraPickerPhoto(){
        pickerPhoto()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}//TODO: - FIN DE LA CLASE


//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension VWRegistroNuevoUsuarioViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
