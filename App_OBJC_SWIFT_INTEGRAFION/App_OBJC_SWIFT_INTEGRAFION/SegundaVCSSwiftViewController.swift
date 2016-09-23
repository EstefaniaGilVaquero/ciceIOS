//
//  SegundaVCSSwiftViewController.swift
//  App_OBJC_SWIFT_INTEGRAFION
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

import UIKit

class SegundaVCSSwiftViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    var personajeStarWars : DatosModel?
    
    //MARK: - IBOUTLET
    @IBOutlet weak var mySegundoSaludoSwiftLBL: UILabel!
    //MARK: - IBACTION
    @IBAction func showSaludaMundoSwift(sender: AnyObject) {
        
        self.mySegundoSaludoSwiftLBL.text = "Hola Estefi"
    }
    //MARK: - LIFE VC

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Esta es la forma de imprimir por consola en swift")
        
        let personaje = DatosModel(whitFirstName: "Anakin", lastName: "Skywalker", alias: "Darth Vader")
        print(personaje)

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
