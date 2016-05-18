//
//  ViewController.swift
//  App_EdadDeMiPerro
//
//  Created by cice on 9/5/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -VARIABLES LOCALES GLOBALES
    var insertNewAge : Int?

    //MARK: - IDOUTLET
    @IBOutlet weak var myTextFieldTF: UITextField!
    @IBOutlet weak var showMyDogAge: UILabel!
    
    //MARK: -IBACTION
    @IBAction func showNewAge(sender: AnyObject) {
        insertNewAge = Int(myTextFieldTF.text!)
        
       /* if let newAge = insertNewAge{
            let showNewAge = newAge * 7
            showMyDogAge.text = "La edad de mi perro siendo calculada por mi Dueño es \(showNewAge)"
        }else{
            print("Coloca la edad de tu perrillo por favor")
        }*/
    
    
    if insertNewAge != nil{
        let showNewAge = insertNewAge! * 7
        showMyDogAge.text = "La edad de mi perro siendo calculada por mi Dueño es \(showNewAge)"
    }else{
        displayAVC()
    }
    
}   
    
    //MARK: - LIVE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- UTILS
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func displayAVC(){
        let alertVC = UIAlertController(title: "hey", message: "Por favor introduce la edad de tu perro", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(alertAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }

}

