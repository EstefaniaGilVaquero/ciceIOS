//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by cice on 4/5/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var mySaludaMundoLabel: UILabel!
    
    
    //MARK: - IBACTION
    
    
    @IBAction func myVengaSaludaACTION(sender: AnyObject) {
        mySaludaMundoLabel.text = "Hola Mundo!"
    }
    
    
    
    //MARK: - LIFE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

