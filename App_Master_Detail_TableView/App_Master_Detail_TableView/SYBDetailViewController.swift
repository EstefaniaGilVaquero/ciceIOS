//
//  SYBDetailViewController.swift
//  App_Master_Detail_TableView
//
//  Created by cice on 15/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBDetailViewController: UIViewController {
    
    //MARK: - VARIABLES GLOBALES LOCALES
    
    var mesData : String?
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myMesDelAnoLLBL: UILabel!
    
    
    
    
    @IBAction func hideVC(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMesDelAnoLLBL.text = mesData

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
