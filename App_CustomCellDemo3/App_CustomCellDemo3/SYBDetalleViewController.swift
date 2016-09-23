//
//  SYBDetalleViewController.swift
//  App_CustomCellDemo3
//
//  Created by cice on 15/6/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class SYBDetalleViewController: UIViewController {
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var twitterData : String?
    var fechaData : String?
    var imageProfileData : UIImage?
    var nombreData : String?
    var apellidoData : String?
    var descripcionData : String?
    var experienciaData : String?
    var seguidoresData : String?
    var abstractData : String?
    
    //MARK: - IBOUTLET

    @IBOutlet weak var myTwitterLBL: UILabel!
    @IBOutlet weak var myFechaLBL: UILabel!
    @IBOutlet weak var myImageProfileIV: UIImageView!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    @IBOutlet weak var myDescripcionLBL: UILabel!
    @IBOutlet weak var myExperienciaLBL: UILabel!
    @IBOutlet weak var mySeguidoresLBL: UILabel!
    @IBOutlet weak var myAbstractLBL: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNombreLBL.text = nombreData
        myApellidoLBL.text = apellidoData
        myTwitterLBL.text = twitterData
        myFechaLBL.text = fechaData
        myDescripcionLBL.text = descripcionData
        myExperienciaLBL.text = experienciaData
        mySeguidoresLBL.text = seguidoresData
        myAbstractLBL.text = abstractData
        myImageProfileIV.image = imageProfileData

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
