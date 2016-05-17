//
//  SYSaludaViewController.swift
//  FotosEdadPerroHolaMundo
//
//  Created by cice on 11/5/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYSaludaViewController: UIViewController {
    
    
    //MARK: - VARIABLES GLOBALES
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var mySaludaLBL: UILabel!
    //MARK: - IBACTION
    
    @IBAction func mySaluda1(sender: AnyObject) {
        mySaludaLBL.text = "Hola Joel"
    }
    
    @IBAction func mySaluda2(sender: AnyObject) {
        mySaludaLBL.text = "Hola Carlos"
    }

    @IBAction func mySaluda3(sender: AnyObject) {
        mySaludaLBL.text = "Hola Ruben"
    }
    
    @IBAction func muSaluda4(sender: AnyObject) {
        mySaludaLBL.text = "Hola Estefania"
    }
    

    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
