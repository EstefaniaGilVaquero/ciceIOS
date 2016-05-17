//
//  SYImagenesViewController.swift
//  FotosEdadPerroHolaMundo
//
//  Created by cice on 11/5/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYImagenesViewController: UIViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myShowPeople: UIImageView!
    
    @IBOutlet weak var myNamePeopleLBL: UILabel!
    
    //MARK: - IBACTION
    
    @IBAction func showPerson1ACTION(sender: AnyObject) {
        myShowPeople.image = UIImage(named: "mario.jpeg")
        myNamePeopleLBL.text = "Hola mario"
    }

    @IBAction func showPerson2ACTION(sender: AnyObject) {
        myShowPeople.image = UIImage(named: "felipa.jpeg")
        myNamePeopleLBL.text = "Hola felipa"
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
