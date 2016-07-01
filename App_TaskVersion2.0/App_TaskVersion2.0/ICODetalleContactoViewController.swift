//
//  ICODetalleContactoViewController.swift
//  App_TaskVersion2.0
//
//  Created by formador on 27/6/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class ICODetalleContactoViewController: UIViewController {

    //MARK: - VARIABLES LOCALES GLOBALES
    var diccionarioData : NSDictionary?
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var degradadoImageView: UIImageView!
    @IBOutlet weak var myImagePerfilIV: UIImageView!
    @IBOutlet weak var myTwitterCountLBL: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myCreadoEnLBL: UILabel!
    @IBOutlet weak var myExpeirenciaLBL: UILabel!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myTelefonoMovilLBL: UILabel!
    @IBOutlet weak var myTrabajoLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLinkedinLBL: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImagePerfilIV.layer.cornerRadius = myImagePerfilIV.frame.width / 8
        myImagePerfilIV.layer.borderColor = UIColor.whiteColor().CGColor
        myImagePerfilIV.layer.borderWidth = 1.5
        
        
        degradadoImageView.layer.cornerRadius = degradadoImageView.frame.width / 8
        degradadoImageView.clipsToBounds = true
        
        let imagePerfil = diccionarioData!["imageProfile"] as? String
        let imagePerfilCustom = UIImage(named: imagePerfil!)
        
        
        myImagePerfilIV.image = imagePerfilCustom
        myNombreLBL.text = diccionarioData!["firstName"] as? String
        myApellidoLBL.text = diccionarioData!["lastName"] as? String

        // Do any additional setup after loading the view.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
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
