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
   /* var logoImage: [UIImage] = [
        UIImage(named: "PlazaCastilla.jpg")!,
        UIImage(named: "GranVia.jpg")!,
        UIImage(named: "puertaAlcala.jpg")!,
        UIImage(named: "Cibeles.jpg")!,
        UIImage(named: "puertaAlcala.jpg")!
        
    ]*/
    
<<<<<<< HEAD
   // var imageArray: [UIImage] = [UIImage(named: "facebook@2x.jpg")!,
    //                             UIImage(named: "icon.twitter@2x.jpg")!,
    //                             UIImage(named: "linkedin@2x.jpg")!]
    
    var fotoArray = ["facebook@2x.jpg","icon.twitter@2x.jpg","linkedin@2x.jpg"]
    
    
=======
>>>>>>> d1f91874e0b4328ba77d652fb668c2af1781f424
    
    @IBOutlet weak var myLocalidadMadrid: UITextField!
    
    @IBOutlet weak var myCodigoPostalDeTuZona: UITextField!
    
    @IBOutlet weak var myPrioridadTrabajo: UITextField!
    
    @IBOutlet weak var myImageCointainer: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aqui construyo los distintos pickers Viwes de la forma mas larga
       /* let pickerViewLocalidadData = UIPickerView()
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
        
        //Picker 3
        let pickerViewPrioridadTrabajo = UIPickerView()
        pickerViewPrioridadTrabajo.delegate = self
        pickerViewPrioridadTrabajo.dataSource = self
        pickerViewPrioridadTrabajo.tag = 3
        
        myPrioridadTrabajo.inputView = pickerViewPrioridadTrabajo
        myPrioridadTrabajo.text = prioridadArrayData[0]*/
<<<<<<< HEAD
        
     //   myImageCointainer.image = UIImage(named: fotoArray[0])
=======
        
        //Forma mas ordenada de crear los pickerView
        
>>>>>>> d1f91874e0b4328ba77d652fb668c2af1781f424
        createPickerView(1, myTextFieldCustom: myLocalidadMadrid, myArray: localidadesArrayData)
        createPickerView(2, myTextFieldCustom: myCodigoPostalDeTuZona, myArray: codigoPostalArrayData)
        createPickerView(3, myTextFieldCustom: myPrioridadTrabajo, myArray: prioridadArrayData)
        
<<<<<<< HEAD
    }
    
    //MARK: - UTILS
    func createPickerView(myTag : Int, myTextFieldCustom : UITextField, myArray : [String]){
    
=======
  
    }
    
    //MARK: - UTILS
    
    func createPickerView(myTag : Int, myTextFieldCustom : UITextField, myArray : [String]){
>>>>>>> d1f91874e0b4328ba77d652fb668c2af1781f424
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = myTag
        myTextFieldCustom.inputView = pickerView
        myTextFieldCustom.text = myArray[0]
<<<<<<< HEAD
    
=======
>>>>>>> d1f91874e0b4328ba77d652fb668c2af1781f424
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
        }else if pickerView.tag == 2{
            myCodigoPostalDeTuZona.text = codigoPostalArrayData[row]
            
        }else{
            myPrioridadTrabajo.text = prioridadArrayData[row]
            myImageCointainer.image = UIImage(named: fotoArray[row])
        }
    }
    
   /* func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width - 30, 60))
        var myImageView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
        var rowString = String()
        
        if pickerView.tag == 3{
            
            switch row {
            case 0:
                rowString = prioridadArrayData[0]
                myImageView = UIImageView(image: UIImage(named:"facebook@2x.png"))
            case 1:
                rowString = prioridadArrayData[1]
                myImageView = UIImageView(image: UIImage(named:"facebook@2x.png"))
            case 2:
                rowString = prioridadArrayData[2]
                myImageView = UIImageView(image: UIImage(named:"facebook@2x.png"))
            default:
                myImageView = UIImageView(image: UIImage(named:"facebook@2x.png"))
            }
        
            let myLabel = UILabel(frame: CGRectMake(60, 0, pickerView.bounds.width - 90, 60 ))
           // myLabel.font = UIFont(name:some font, size: 18)
           // myLabel.text = rowString
            
            myView.addSubview(myLabel)
            myView.addSubview(myImageView)
            

        }
        return myView
    }*/
    
}

