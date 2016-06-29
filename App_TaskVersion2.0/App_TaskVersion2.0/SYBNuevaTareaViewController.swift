//
//  SYBNuevaTareaViewController.swift
//  App_TaskVersion2.0
//
//  Created by cice on 29/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBNuevaTareaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayPrioridad = ["ALTA","MEDIA-ALTA","MEDIA","BAJA","SIN PRIORIDAD"]
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var MyNuevaTarea: UITextField!
    @IBOutlet weak var MyPrioridadNuevaTareaTF: UITextField!
    @IBOutlet weak var myFechaNuevaTareaTF: UITextField!
    @IBOutlet weak var myDescripcionNuevaTareaTV: UITextView!
    @IBOutlet weak var myPresentaNuevaCategoriaLBL: UILabel!
    @IBOutlet weak var myCategoriaButton: UIButton!
    @IBOutlet weak var mySalvarTareaButton: UIButton!
    @IBOutlet weak var myImagenNuevaTareaIV: UIImageView!
    
    
    
    @IBAction func salvarInfoNSUerdefaults(sender: AnyObject) {
    }
    
    @IBAction func cierraTextField(sender: AnyObject) {
        MyNuevaTarea.resignFirstResponder()
    }
    
    @IBAction func showDatePickerV(sender: UITextField) {
        //---- DATE PICKER VIEW -----//
        let datePickerV = UIDatePicker()
        datePickerV.datePickerMode = .DateAndTime
        sender.inputView = datePickerV
        datePickerV.addTarget(self, action: #selector(SYBNuevaTareaViewController.datePickerValueChanged(_:)), forControlEvents: .ValueChanged)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Redondeamos esquinas de los botones
        
        myCategoriaButton.layer.cornerRadius = myCategoriaButton.frame.width/16
        mySalvarTareaButton.layer.cornerRadius = myCategoriaButton.frame.width/22
        myImagenNuevaTareaIV.layer.cornerRadius = myImagenNuevaTareaIV.frame.width/8
        myImagenNuevaTareaIV.layer.borderColor = UIColor.blackColor().CGColor
        myImagenNuevaTareaIV.layer.borderWidth = 1.5
        
        //Habilitamos la imagen para que ejecute una accion
        
        myImagenNuevaTareaIV.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SYBNuevaTareaViewController.actionGesture(_:)))
        myImagenNuevaTareaIV.addGestureRecognizer(tapGesture)
        
        //---- PICKER VIEW -----//
        let pickerView = UIPickerView()
        pickerView.delegate = self
        MyPrioridadNuevaTareaTF.inputView = pickerView
        MyPrioridadNuevaTareaTF.text = arrayPrioridad[0]
        
        //Aqui introduzco un toolbar al pickerView
        let toolbar = UIToolbar(frame: CGRectMake(0,0,0,40))
        toolbar.barStyle = UIBarStyle.Black
        toolbar.tintColor = UIColor.whiteColor()
        toolbar.backgroundColor = UIColor.blackColor()
        
        //Aqui creamos el boton con el patron de diseño TARGET/ACTION
        
        let closeToolBarButton = UIBarButtonItem(title: "Cerrar", style: .Done, target: self, action: #selector(SYBNuevaTareaViewController.closeButtonAction(_:)))
        
        //Aqui le asignamos al toolbar el array de botones
        toolbar.items = [closeToolBarButton]
        
        //Aqui asignamos dicho toolbar como un accesorio del textField de Prioridad
        MyPrioridadNuevaTareaTF.inputAccessoryView = toolbar
        
        //Muestro una fecha por defecto
        showFechaPorDefecto()
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - UTILS
    //TODO: - GESTO DE RECONOCIMIENTO
    
    func actionGesture (tapGesture : UITapGestureRecognizer){
        pickerPoto()
    }
    
    func closeButtonAction (sender : UITextField){
        MyPrioridadNuevaTareaTF.resignFirstResponder()
    }
    
    func datePickerValueChanged (sender : UIDatePicker){
        let dateFormater = NSDateFormatter()
        dateFormater.dateStyle = .LongStyle
        dateFormater.timeStyle = .LongStyle
        myFechaNuevaTareaTF.text = dateFormater.stringFromDate(sender.date)
    }
    
    func showFechaPorDefecto(){
        let dateFormater = NSDateFormatter()
        dateFormater.dateStyle = .LongStyle
        dateFormater.timeStyle = .LongStyle
        myFechaNuevaTareaTF.text = dateFormater.stringFromDate(NSDate())

        
    }
    

}

//MARK: - DELEGATE UIIMAGEPIKER / PHOTO
extension SYBNuevaTareaViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        myImagenNuevaTareaIV.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

//MARK: - DELEGATE / DATASOURCE DE PICKERVIEW
extension SYBNuevaTareaViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
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
        MyPrioridadNuevaTareaTF.text = arrayPrioridad[row]
    }
    
}



