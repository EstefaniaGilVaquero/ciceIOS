//
//  WWRegistroNuevoUsuarioViewController.swift
//  
//
//  Created by CICE on 3/10/16.
//
//

import UIKit
import Parse

class WWRegistroNuevoUsuarioViewController: UIViewController {
    
    //MARK: - VARIABLES LOCACLES GLOBALES
    
    var fotoSeleccionada = false
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myUserNameTF: UITextField!
    @IBOutlet weak var myPaswordTF: UITextField!
    @IBOutlet weak var myNombreUsuarioTF: UITextField!
    @IBOutlet weak var myApellidoUsuarioTF: UITextField!
    @IBOutlet weak var myEmailUsuarioTF: UITextField!
    @IBOutlet weak var myMovilUsuarioTF: UITextField!
    @IBOutlet weak var myLocalidadUsuarioTF: UITextField!
    @IBOutlet weak var myAsociacionUsuarioTF: UITextField!
    
    
    
    
    //MARK: - IBACTION
    @IBAction func myRegistroNuevoUsuarioACTION(sender: AnyObject) {
        var errorInicial = ""
        
        if myUserNameTF.text == "" || myPaswordTF.text == ""
            || myNombreUsuarioTF.text == "" || myApellidoUsuarioTF.text == ""
            || myLocalidadUsuarioTF.text == "" || myEmailUsuarioTF.text == ""
            || myAsociacionUsuarioTF.text == "" || myImagenPerfil.image == nil{
            errorInicial = "Estimado usuario por favor rellene todos los campos"
        }else{
            //La instancia para interactuar con parse
            let user = PFUser()
            user.username = myUserNameTF.text
            user.password = myPaswordTF.text
            user["nombre"] = myNombreUsuarioTF.text
            user["apellido"] = myApellidoUsuarioTF.text
            user.email = myEmailUsuarioTF.text
            user["movio"] = myMovilUsuarioTF.text
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
                        errorDataPost = "Por favor selecciona una imagen para registrarte"
                    }
                
//                    if errorDataPost != ""{
//                        self.showAlertVCFinal("ATENCION", mensageData: "Existe un error en el registro")
//                    }
                
                    if errorDataSingUp != nil{
                        if let errorString = errorDataSingUp!.userInfo["error"] as? NSString{
                            self.showAlertVCFinal("ATENCION", mensageData: errorString as String)
                        }else{
                            self.showAlertVCFinal("ATENCION", mensageData: "Existe un error en el registro")
                        }
                    }else{
                        //Metodo de salvar imagen
                        self.singUpConFoto()
                    }
            })
            
            
        }
        
        if errorInicial != ""{
            showAlertVCFinal("ATENCION", mensageData: errorInicial)
        }
    }
    
    
    @IBAction func myOcultarVCACTION(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(tituloData : String, mensageData : String){
        let alertVC = UIAlertController(title: tituloData, message: mensageData, preferredStyle: .Alert)
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
                self.showAlertVCFinal("ATENCION", mensageData: "Datos salvados satisfactoriamente")
            }else{
                self.showAlertVCFinal("ATENCION", mensageData: "Error en el registro")
            }
            self.fotoSeleccionada = false
            self.myImagenPerfil.image = UIImage(named: "placeholder")
        }
        
        print("Usuario registrado con exito")
        self.myUserNameTF.text = ""
        self.myPaswordTF.text = ""
        self.myNombreUsuarioTF.text = ""
        self.myEmailUsuarioTF.text = ""
        self.myApellidoUsuarioTF.text = ""
        self.myAsociacionUsuarioTF.text = ""
        self.myLocalidadUsuarioTF.text = ""
        self.myMovilUsuarioTF.text = ""
        
        self.performSegueWithIdentifier("saltarTabBarController", sender: self)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator.hidden = true
        myImagenPerfil.userInteractionEnabled = true
        let tocaImagen = UITapGestureRecognizer(target: self, action: #selector(WWRegistroNuevoUsuarioViewController.muestraPickerPhoto))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

} //MARK: - FIN DE LA CLASE

//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension WWRegistroNuevoUsuarioViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
