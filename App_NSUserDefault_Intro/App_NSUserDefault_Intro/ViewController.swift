//
//  ViewController.swift
//  App_NSUserDefault_Intro
//
//  Created by cice on 22/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - CONSTANTES
    
    static let nombre = "NOMBRE"
    static let apellido = "APELLIDO"
    static let direccion = "DIRECCION"
    static let telefono = "TELEFONO"
    static let ultimaActualizacion = "ULTIMA_ACTUALIZACION"
    static let imagenPerfil = "IMAGEN_PERFIL"
    
    let prefs = NSUserDefaults.standardUserDefaults()
    let dateFormatter = NSDateFormatter()
    
    
    //MARK: - IBOUTLET
    
    
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myLabelActualizaDatos: UILabel!
    @IBOutlet weak var myNombreTF: UITextField!
    @IBOutlet weak var myApellidoTF: UITextField!
    @IBOutlet weak var myDireccionTF: UITextField!
    @IBOutlet weak var myTelefonoTF: UITextField!
    
    
    //MARK: - IBACTION
    
    @IBAction func salvarDatosNSUserDefault(sender: AnyObject) {
        if (myNombreTF.text!.characters.count > 0) && (myApellidoTF.text!.characters.count > 0) && (myDireccionTF.text!.characters.count > 0) && (myTelefonoTF.text!.characters.count > 0){
            
            prefs.setObject(myNombreTF.text, forKey: ViewController.nombre)
            prefs.setObject(myApellidoTF.text, forKey: ViewController.apellido)
            prefs.setObject(myDireccionTF.text, forKey: ViewController.direccion)
            prefs.setObject(myTelefonoTF.text, forKey: ViewController.telefono)
            
            let imageData = UIImageJPEGRepresentation(myImagenPerfil.image!, 0.5)
            prefs.setObject(imageData, forKey: ViewController.imagenPerfil)
            
            let actualizacion = NSDate()
            prefs.setObject(actualizacion, forKey: ViewController.ultimaActualizacion)
            
            showAltVC("Hola", messageData: "Estimado usuario tu imagen se ha salvado correctamente")
        }else{
        
            showAltVC("Hola", messageData: "Estimado usuario no se ha logrado salvar la informacion")
        
        
        }
    }
    
    @IBAction func actualizarInformacionNSUserDefault(sender: AnyObject) {
        
        
        if let imageData = prefs.objectForKey(ViewController.imagenPerfil) as? NSData{
            let storageImage = UIImage(data: imageData)
            myImagenPerfil.image = storageImage
        }
        
        dateFormatter.dateStyle = .MediumStyle
        if let lastUpdateStore = prefs.objectForKey(ViewController.ultimaActualizacion) as? NSDate{
            myLabelActualizaDatos.text = "Ultima actualizacion" + dateFormatter.stringFromDate(lastUpdateStore)
        }else{
            myLabelActualizaDatos.text = "Ultima Actualización no realizada"
        }
        
        if let nombreData = prefs.stringForKey(ViewController.nombre){
            myNombreTF.text = nombreData
        }
        
        if let apellidoData = prefs.stringForKey(ViewController.apellido){
            myApellidoTF.text = apellidoData
        }
        
        if let direccionData = prefs.stringForKey(ViewController.direccion){
            myDireccionTF.text = direccionData
        }
        
        if let telefonoData = prefs.stringForKey(ViewController.telefono){
            myTelefonoTF.text = telefonoData
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Habilitamos la Imagen para que me ejecute el patron de diseño TARGET / ACTION
        myImagenPerfil.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.actionGesture(_:)))
        
        myImagenPerfil.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - UTILS
    func actionGesture(gestureRecognizer : UITapGestureRecognizer){
        pickerPoto()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showAltVC(titleData : String, messageData : String){
        let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: { Void in
            self.myTelefonoTF.text = ""
            self.myApellidoTF.text = ""
            self.myNombreTF.text = ""
            self.myDireccionTF.text = ""
            self.myLabelActualizaDatos.text = ""
            //self.myImagenPerfil.image = UIImage(named: "image.jpg")
        }))
        
        presentViewController(alertVC, animated: true, completion: nil)
    
    }
    
}


//MARK: - DELEGATE UIIMAGEPIKER / PHOTO
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPoto(){
        
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
            self.takePhotoWithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Escoge de la librera", style: .Default) { Void in
            self.choosePhotoFromLibrary()
        }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(takePhotoAction)
        alertVC.addAction(chooseFromLibraryAction)
        
        presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
    func takePhotoWithCamera(){
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
        myImagenPerfil.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
}





