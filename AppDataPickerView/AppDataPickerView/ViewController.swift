//
//  ViewController.swift
//  AppDataPickerView
//
//  Created by stefy83 on 24/05/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myDateLBL: UILabel!
    
    @IBOutlet weak var myDateTF: UITextField!
    
    
    //MARK: - IBACTION
    
    @IBAction func showPickerDateEditing(myTextField: UITextField) {
    
  
        //Fase de creacion del pickerDate
        let pickerDateView = UIDatePicker()
        pickerDateView.datePickerMode = UIDatePickerMode.DateAndTime
        myTextField.inputView = pickerDateView
        pickerDateView.addTarget(self, action: #selector(ViewController.datePickerValueChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    //MARK: - UTILS
    
    func datePickerValueChanged(sender: UIDatePicker){
        let dateFormatter = NSDateFormatter()
        
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

