//
//  CCPickerWithTextFieldViewController.swift
//  AppDatePickerPickerView
//
//  Created by cice on 20/5/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class CCPickerWithTextFieldViewController: UIViewController {
    
    
    //MARK: - IBOUTLET
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var localidadesArrayData = ["Salamanca", "La Latina", "Centro", "Fuencarral", "PepitoPerez"]
    var codigoPostalArrayData = ["28001","28006","28010","28026"]
    var prioridadArrayData = ["ALTA","MEDIA","BAJA"]
    var logoImage: [UIImage] = [
        UIImage(named: "PlazaCastilla.jpg")!,
        UIImage(named: "GranVia.jpg")!,
        UIImage(named: "puertaAlcala.jpg")!,
        UIImage(named: "Cibeles.jpg")!,
        UIImage(named: "puertaAlcala.jpg")!
        
    ]
    
    
    
    @IBOutlet weak var myLocalidadMadrid: UITextField!
    
    @IBOutlet weak var myCodigoPostalDeTuZona: UITextField!
    
    @IBOutlet weak var myPrioridadTrabajo: UITextField!
    
    @IBOutlet weak var myImageCointainer: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aqui construyo los distintos pickers Viwes
        let pickerViewLocalidadData = UIPickerView()
        pickerViewLocalidadData.delegate = self
        pickerViewLocalidadData.dataSource = self
        pickerViewLocalidadData.tag = 1
        
        myLocalidadMadrid.inputView = pickerViewLocalidadData
        myLocalidadMadrid.text = localidadesArrayData[0]
        myImageCointainer.image = logoImage[0]
        
        
        let pickerViewCodigoPostal = UIPickerView()
        pickerViewCodigoPostal.delegate = self
        pickerViewCodigoPostal.dataSource = self
        pickerViewCodigoPostal.tag = 2
        
        myCodigoPostalDeTuZona.inputView = pickerViewCodigoPostal
        myCodigoPostalDeTuZona.text = codigoPostalArrayData[0]
        
        let pickerViewPrioridadTrabajo = UIPickerView()
        pickerViewPrioridadTrabajo.delegate = self
        pickerViewPrioridadTrabajo.dataSource = self
        pickerViewPrioridadTrabajo.tag = 3
        
        myPrioridadTrabajo.inputView = pickerViewPrioridadTrabajo
        myPrioridadTrabajo.text = prioridadArrayData[0]
        
        
        

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

//MARK: - DELEGADO PICKER VIEW
extension CCPickerWithTextFieldViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1{
            return localidadesArrayData.count
            
        }else if pickerView.tag == 2{
           return codigoPostalArrayData.count
            
        }else{
            return prioridadArrayData.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return localidadesArrayData[row]
            
        }else if pickerView.tag == 2{
            return codigoPostalArrayData[row]
            
        }else{
            return prioridadArrayData[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            myLocalidadMadrid.text = localidadesArrayData[row]
            myImageCointainer.image = logoImage[row]
            
        }else if pickerView.tag == 2{
            myCodigoPostalDeTuZona.text = codigoPostalArrayData[row]
            
        }else{
            myPrioridadTrabajo.text = prioridadArrayData[row]
        }
    }
    
    
}













