//
//  ViewController.swift
//  CICETARGET
//
//  Created by stefy83 on 24/05/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - IBACTION
    
    @IBAction func showAlertACTION(sender: AnyObject) {
        
        let alertVC = UIAlertController(title: "Hola mundo", message: "Bienvenido a Target", preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "Asombroso", style: .Default, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
        
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

