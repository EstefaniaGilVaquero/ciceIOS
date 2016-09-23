//
//  ICONuevaTareaViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 29/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit


class ICONuevaTareaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayPrioridad = ["ALTA", "MEDIA - ALTA", "MEDIA", "BAJA", "SIN PRIORIDAD"]
    var contadorNegativo = 140
    var nombreCategoria = "Sin Categoría"
    var CONSTANTES = Constantes()
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNuevaTareaTF: UITextField!
    @IBOutlet weak var myPrioridadNuevaTareaTF: UITextField!
    @IBOutlet weak var myFechaNuevaTarea: UITextField!
    @IBOutlet weak var myPresentaNuevaCategoriaLBL: UILabel!
    @IBOutlet weak var myCategoriaButton: UIButton!
    @IBOutlet weak var mySalvarTareaButton: UIButton!
    @IBOutlet weak var myImagenNuevaTareaIV: UIImageView!
    @IBOutlet weak var myContadorCaracteres: UILabel!
    @IBOutlet weak var descripcionTarea: UITextField!
    
    //MARK: - IBACTION
    @IBAction func salvarInfoNSUserdefaults(sender: AnyObject) {
        
        if myNuevaTareaTF.text != ""{
            
            if descripcionTarea.text != ""{
                
                if fotoSeleccionada{
                    
                    //TODO: - IMAGEN
                    let imageDataComplete : NSData = UIImageJPEGRepresentation(myImagenNuevaTareaIV.image!, 0.5)!
                    
                    let prefs = NSUserDefaults.standardUserDefaults()
                    
                    myListaTareas.append(myNuevaTareaTF.text!)
                    myListaPrioridadTareas.append(myPrioridadNuevaTareaTF.text!)
                    myListaFechaTareas.append(myFechaNuevaTarea.text!)
                    myListaDescripcionTareas.append(descripcionTarea.text!)
                    myListaCategoriatareas.append(myPresentaNuevaCategoriaLBL.text!)
                    myListaFotostareas.append(imageDataComplete)
                    
                    prefs.setObject(myListaTareas, forKey: self.CONSTANTES.LISTA_TAREA_KEY)
                    prefs.setObject(myListaPrioridadTareas, forKey: self.CONSTANTES.LISTA_PRIORIDAD_KEY)
                    prefs.setObject(myListaFechaTareas, forKey: self.CONSTANTES.LISTA_FECHA_KEY)
                    prefs.setObject(myListaDescripcionTareas, forKey: self.CONSTANTES.LISTA_DESCRIPCION_KEY)
                    prefs.setObject(myListaCategoriatareas, forKey: self.CONSTANTES.LISTA_CATEGORIA_KEY)
                    prefs.setObject(myListaFotostareas, forKey: self.CONSTANTES.LISTA_FOTO_KEY)
                    
                    //NOTIFICACION PUSH LOCAL
                    let localNotification = UILocalNotification()
                    localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
                    localNotification.alertBody = myNuevaTareaTF.text
                    localNotification.timeZone = NSTimeZone.defaultTimeZone()
                    localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
                    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
                    
                    presentViewController(showAlertVC("Atención", messageData: "Datos salvados correctamente"), animated: true, completion: {
                        Void in
                        
                        self.limpiarDatos()
                    })
                    
                }else{
                    
                    presentViewController(showAlertVC("Atención", messageData: "Es necesario que selecciones una foto para tu tarea"), animated: true, completion: nil)
                }
                
            }else{
                
                presentViewController(showAlertVC("Atención", messageData: "Es necesario que describas la Tarea"), animated: true, completion: nil)
                
            }
            
        }else{
            
            presentViewController(showAlertVC("Atención", messageData: "Es necesario que escribas un tarea"), animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func cierraTextField(sender: AnyObject) {
        
        myNuevaTareaTF.resignFirstResponder()
    }
    
    
    @IBAction func shoeDatePickerV(sender: UITextField) {
        
        //Aqui creo el DatePicker
        let datePickerV = UIDatePicker()
        datePickerV.datePickerMode = .DateAndTime
        sender.inputView = datePickerV
        datePickerV.addTarget(self, action: #selector(ICONuevaTareaViewController.datePickerValueChanged(_:)), forControlEvents: .ValueChanged)
        
    }
    
    
    @IBAction func contadorNegativoDescripcion140(sender: UITextField) {
        
        if descripcionTarea.text?.characters.count >= 0{
            myContadorCaracteres.text = "\(contadorNegativo - (descripcionTarea.text?.characters.count)!)"
        }
        
    }
    
    
    //MARK: -LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aqui hacemos las esquinas redondas de los botones
        myCategoriaButton.layer.cornerRadius = myCategoriaButton.frame.width/16
        mySalvarTareaButton.layer.cornerRadius = mySalvarTareaButton.frame.width/26
        
        //Aqui redondeamos la imagen con un bordede color y un ancho de borde
        myImagenNuevaTareaIV.layer.cornerRadius = myImagenNuevaTareaIV.frame.width / 8
        myImagenNuevaTareaIV.layer.borderColor = UIColor.blackColor().CGColor
        myImagenNuevaTareaIV.layer.borderWidth = 1.5
        
        //Aqui habilitamos la imagen para que ejecute una Accion
        myImagenNuevaTareaIV.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ICONuevaTareaViewController.actionGesture(_:)))
        
        //Aqui asignamos el gesto a la Imagen
        myImagenNuevaTareaIV.addGestureRecognizer(tapGesture)
        
        //Aqui creo el pickerView
        let pickerView = UIPickerView()
        pickerView.delegate = self
        myPrioridadNuevaTareaTF.inputView = pickerView
        myPrioridadNuevaTareaTF.text = arrayPrioridad[0]
        
        //Aqui introduzco un toolbar al pickerView
        let toolbar = UIToolbar(frame: CGRectMake(0,0,0,40))
        toolbar.barStyle = UIBarStyle.Black
        toolbar.tintColor = UIColor.whiteColor()
        toolbar.backgroundColor = UIColor.blackColor()
        
        //Aqui creamos el boton con el patron de diseño TARGET / ACTION
        let closeToolBarButton = UIBarButtonItem(title: "Cerrar", style: .Done, target: self, action: #selector(ICONuevaTareaViewController.closeButtonAction(_:)))
        
        //Aqui le asignamos al toolbar el array de botones
        toolbar.items = [closeToolBarButton]
        
        //Aqui asignamos dicho toolbar como un accesorio del textField de Prioridad
        myPrioridadNuevaTareaTF.inputAccessoryView = toolbar
        
        showFechaPorDefecto()
        descripcionTarea.delegate = self
        myPresentaNuevaCategoriaLBL.text = nombreCategoria
        
        //TODO: - Aqui encuentro la ruta de mi Simulador
        print(NSBundle.mainBundle())
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UTILS
    //TODO: - GESTO DE RECONOCIMIENTO
    func actionGesture(tapGesture : UITapGestureRecognizer){
        pickerPhoto()
    }
    
    
    func closeButtonAction(sender : UITextField){
        
        myPrioridadNuevaTareaTF.resignFirstResponder()
    }
    
    func datePickerValueChanged(sender : UIDatePicker){
        
        let dateFormater = NSDateFormatter()
        dateFormater.dateStyle = .ShortStyle
        dateFormater.timeStyle = .ShortStyle
        myFechaNuevaTarea.text = dateFormater.stringFromDate(sender.date)
        
    }
    
    func showFechaPorDefecto(){
        
        let dateFormater = NSDateFormatter()
        dateFormater.dateStyle = .ShortStyle
        dateFormater.timeStyle = .ShortStyle
        myFechaNuevaTarea.text = dateFormater.stringFromDate(NSDate())
    }
    
    func limpiarDatos(){
        myNuevaTareaTF.text = ""
        descripcionTarea.text = ""
        myPresentaNuevaCategoriaLBL.text = nombreCategoria
        myImagenNuevaTareaIV.image = UIImage(named: "placeholder")
    }
    
    
    //MARK: - SEGUE NORMAL
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seleccionaNuevaCategoria"{
            let categoriaVC = segue.destinationViewController as! ICOCategoriasTableViewController
            categoriaVC.nombreCategoriaSeleccionada = nombreCategoria
            
        }
    }
    
    //MARK: - SEGUE ESPECIAL
    @IBAction func categoriaSeleccionadaDesdeTVCCategoria(segue : UIStoryboardSegue){
        
        let categoriaVC = segue.sourceViewController as! ICOCategoriasTableViewController
        nombreCategoria = categoriaVC.nombreCategoriaSeleccionada
        myPresentaNuevaCategoriaLBL.text = nombreCategoria
        
    }
    
    
   
}



//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension ICONuevaTareaViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        myImagenNuevaTareaIV.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


//MARK: - DELEGATE / DATASOURCE DE PICKERVIEW
extension ICONuevaTareaViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPrioridad.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPrioridad[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         myPrioridadNuevaTareaTF.text = arrayPrioridad[row]
    }
    
}

//MARK: - DELEGATE TEXTFIELD
extension ICONuevaTareaViewController : UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let newLength = (descripcionTarea.text?.characters.count)! + string.utf16.count - range.length
        return newLength <= 140 // Bool
    }
    
}



