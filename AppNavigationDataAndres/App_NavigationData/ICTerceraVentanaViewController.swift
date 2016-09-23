//
//  ICTerceraVentanaViewController.swift
//  App_NavigationData
//
//  Created by formador on 3/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICTerceraVentanaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var variables = VariablesGlobales()
    
    var codigoPostalArray = ["28001", "28006", "28050", "28226"]
    var ciudadArray = ["Madrid", "Barcelona", "Sevilla", "Valencia"]
    var posicionGeograficaArray = ["40.4512 / -3.2514", "132.4512 / -35.2514", "140.4512 / -34.2514","10.4512 / -1.2514"]
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myTelefonoLBL: UILabel!
    @IBOutlet weak var myDireccionLBL: UILabel!
    @IBOutlet weak var myEdadPerroLBL: UILabel!
    
    
    @IBOutlet weak var myCodigoPostalTF: UITextField!
    @IBOutlet weak var myCiudadTF: UITextField!
    @IBOutlet weak var myPosicionGeoTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNombreLBL.text = variables.nombreData
        myApellidoLBL.text = variables.apellidoData
        myTelefonoLBL.text = variables.telefonoMovilData
        myDireccionLBL.text = variables.direccionData
        myEdadPerroLBL.text = variables.edadPerroData

        crearPicker(myCodigoPostalTF, myArray: codigoPostalArray, myTag: 0, myDelegateVC: self, myDataSourceVC:self)
        crearPicker(myCiudadTF, myArray: ciudadArray, myTag: 1, myDelegateVC: self, myDataSourceVC: self)
        crearPicker(myPosicionGeoTF, myArray: posicionGeograficaArray, myTag: 2, myDelegateVC: self, myDataSourceVC: self)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueV4"{
         
            let ventanaV4 = segue.destinationViewController as! ICCuartaVenetanaViewController
            
            ventanaV4.variables.nombreData = self.myNombreLBL.text
            ventanaV4.variables.apellidoData = self.myApellidoLBL.text
            ventanaV4.variables.telefonoMovilData = self.myTelefonoLBL.text
            ventanaV4.variables.direccionData = self.myDireccionLBL.text
            ventanaV4.variables.edadPerroData = self.myEdadPerroLBL.text
            ventanaV4.variables.codigoPostalData = self.myCodigoPostalTF.text
            ventanaV4.variables.ciudadData = self.myCiudadTF.text
            ventanaV4.variables.posicionGeograficaData = self.myPosicionGeoTF.text

        }else{
            
            presentViewController(displayAlertVC("Hey", messageData: "No se ha logrado enviar la info"), animated: true, completion: nil)
        }
    }
    

}




//MARK: - DELEGATE / DATASOURCE DE PICKERVIEW
extension ICTerceraVentanaViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return codigoPostalArray.count
        }else if pickerView.tag == 1{
            return ciudadArray.count
        }else{
            return posicionGeograficaArray.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return codigoPostalArray[row]
        }else if pickerView.tag == 1{
            return ciudadArray[row]
        }else{
            return posicionGeograficaArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            myCodigoPostalTF.text = codigoPostalArray[row]
            //myImagenCiudadIV.image = UIImage(named: imagenesArray[row])
        }else if pickerView.tag == 1{
            myCiudadTF.text = ciudadArray[row]
        }else{
            myPosicionGeoTF.text = posicionGeograficaArray[row]
        }
    }

}
