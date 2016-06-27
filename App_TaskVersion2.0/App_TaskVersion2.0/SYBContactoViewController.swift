//
//  SYBContactoViewController.swift
//  App_TaskVersion2.0
//
//  Created by cice on 27/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBContactoViewController: UIViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var imagenPerfilData : UIImage?
    var imagenTwitterData : String?
    var nombreData : String?
    var apellidoData : String?
    var creadoEnData : String?
    var experienciaData : String?
    var descripcionData : String?
    var telefonoMovilData : String?
    var telefonoTrabajoData : String?
    var emailData : String?
    var linkedinData : String?
    
    //MARK - IBOUTLET
    
    
    @IBOutlet weak var myDegradadoIV: UIImageView!
    @IBOutlet weak var myImageIV: UIImageView!
    @IBOutlet weak var myTwitterLBL: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myCreadoLBL: UILabel!
    @IBOutlet weak var myExperienciaLBL: UILabel!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myTelefonoMovilLBL: UILabel!
    @IBOutlet weak var myTelefonoTrabajoLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLinkedinLBL: UILabel!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()

        
        myImageIV.layer.cornerRadius = myImageIV.frame.width / 8
        myImageIV.layer.borderColor = UIColor.whiteColor().CGColor
        myImageIV.layer.borderWidth = 1.5
        
        myDegradadoIV.layer.cornerRadius = myDegradadoIV.frame.width / 8
        myDegradadoIV.clipsToBounds = true
        
        
    myNombreLBL.text = nombreData
    myApellidoLBL.text = apellidoData
    myImageIV.image = imagenPerfilData
    
    
    
    
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
