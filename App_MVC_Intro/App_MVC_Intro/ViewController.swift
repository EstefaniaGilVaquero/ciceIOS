//
//  ViewController.swift
//  App_MVC_Intro
//
//  Created by cice on 6/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let personaje = ICOPersoneje(aFirstName: "Anakin", aLastName: "Skywalker", aAlias: "DarthVader")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(personaje)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


}

